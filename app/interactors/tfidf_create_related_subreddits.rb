# Given subreddit, find the closest matches to other subreddits
# with a weight excluding itself
# require 'similarity'
require 'thread/pool'

require "activerecord-import/base"
 ActiveRecord::Import.require_adapter('postgresql')

class TFIDFCreateRelatedSubreddits
  include Interactor
  before :check_sub_reddit
  before :check_sub_reddits

  def call
    compare_subreddits
    context.message = 'Related Sub Reddits Created'
  end

  def check_sub_reddit
    return if context.sub_reddit
    context.fail!('Missing Subreddit')
  end

  def check_sub_reddits
    return if context.sub_reddits
    context.fail!('Missing Subreddit')
  end

  # TODO: Refactor
  def compare_subreddits

    relation_hash = Hash.new
    iterator = 0
    context.sub_reddits.each do |sub_reddit|
      relation_hash.merge!(iterator => sub_reddit.id)
      iterator +=1
    end

    documents = context.sub_reddits.map(&:document)

    search = RSemantic::Search.new(documents, :transforms => [:TFIDF])

    inserts, sub_reddit_ids, weights, sub_reddit_relation_ids = [], [], [], []

    progress_bar = ProgressBar.create(title: 'subreddits:relate',
                                      smoothing: 0.6,
                                      starting_at: 0,
                                      total: context.sub_reddits.size,
                                      format: "%a %e %P% Building: %c from %C")
    pool = Thread.pool(20)
    context.sub_reddits.size.times do |number|
          pool.process do
          iterator = 0
          search.related(number).each do |related_element|
             if ((relation_hash[number] != relation_hash[iterator]) && number < iterator)
               inserts << [relation_hash[number], related_element, relation_hash[iterator]]

            #    inserts << RelatedSubReddit.new do |related_subreddit|
            #      related_subreddit.sub_reddit_id =  relation_hash[number] # Origin
            #      related_subreddit.sub_reddit_relation_id = relation_hash[iterator]                     # relational doc
            #      related_subreddit.weight = related_element # weight
            #  end
            end
            iterator +=1
          end

        RelatedSubReddit.import [:sub_reddit_id, :weight, :sub_reddit_relation_id], inserts
        inserts = []

        progress_bar.increment
      end
    end
  end
end
