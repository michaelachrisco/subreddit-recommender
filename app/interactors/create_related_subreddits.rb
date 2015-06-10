# Given subreddit, find the closest matches to other subreddits
# with a weight excluding itself
require 'similarity'
require 'awesome_print'

class CreateRelatedSubreddits
  include Interactor
  before :check_sub_reddit
  # before :compare_subreddits

  def call
    # ap compare_subreddits
    compare_subreddits
    context.message = 'Related Sub Reddits Created'
  end

  def check_sub_reddit
    return if context.sub_reddit
    context.fail!('Missing Subreddit')
  end

  # TODO: Refactor
  def compare_subreddits
    corpus = Corpus.new
    subreddits = SubReddit.all.reject { |x| x.name == context.sub_reddit.name }
    # TODO: DO NOTHING IF FIRST

    collection_documents = []

    # initial document
    collection_documents << Document.new(content: context.sub_reddit.document, id: context.sub_reddit.id)

    subreddits.map do |reddit|
      collection_documents << Document.new(content: reddit.document, id: reddit.id)
    end

    collection_documents.each { |doc| corpus << doc }
    corpus.similar_documents(collection_documents[0]).each do |doc, similarity|
      if collection_documents[0].id != doc.id
        RelatedSubReddit.create do |related_subreddit|
          related_subreddit.sub_reddit_id =  collection_documents[0].id # Origin document
          related_subreddit.sub_reddit_relation_id = doc.id                     # relational doc
          related_subreddit.weight = similarity # weight
        end
      end
    end
  end
end
