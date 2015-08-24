# Given subreddit, find the closest matches to other subreddits
# with a weight excluding itself
# require 'similarity'
require 'awesome_print'

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
    all_possible_relations = RelatedSubReddit.all_relations(context.sub_reddit)
    # exclude already done subreddit relations
    if all_possible_relations.empty?
      excluded_subreddits = context.sub_reddits
    else
      excluded_subreddits = context.sub_reddits - all_possible_relations
    end


    subreddits = excluded_subreddits.reject { |x| x.name == context.sub_reddit.name }
    ap "rejected_subreddit #{subreddits.size}"

    subreddits = [context.sub_reddit] + subreddits
    ap "with self #{subreddits.size}"
    ap subreddits.map(&:name)
    p

    relation_hash = Hash.new
    iterator = 0
    subreddits.each do |sub_reddit|
      relation_hash.merge!(iterator => sub_reddit.id)
      iterator +=1
    end

    documents = excluded_subreddits.map(&:document)

    search = RSemantic::Search.new(documents, :transforms => [:TFIDF])

    iterator = 0
    search.related(0).each do |related_element|
      ap "iterator #{iterator}"
      ap related_element
       if relation_hash[0] != relation_hash[iterator]
         RelatedSubReddit.create do |related_subreddit|
           related_subreddit.sub_reddit_id =  relation_hash[0] # Origin
           related_subreddit.sub_reddit_relation_id = relation_hash[iterator]                     # relational doc
           related_subreddit.weight = related_element # weight
       end
      end
      ap RelatedSubReddit.all.size
      iterator +=1
    end
  end
end
