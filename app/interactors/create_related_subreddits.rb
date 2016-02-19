# Given subreddit, find the closest matches to other subreddits
# with a weight excluding itself
require 'similarity'

class CreateRelatedSubreddits
  include Interactor
  before :check_sub_reddit
  before :check_sub_reddits
  # before :compare_subreddits

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
    context.fail!('Missing Subreddits')
  end

  # TODO: Refactor
  def compare_subreddits
    corpus = Corpus.new
    # exclude already done subreddit relations
    all_possible_relations = RelatedSubReddit.all_relations(context.sub_reddit)
    # exclude already done subreddit relations
    if all_possible_relations.empty?
      excluded_subreddits = context.sub_reddits
    else
      excluded_subreddits = context.sub_reddits - all_possible_relations
    end


    subreddits = excluded_subreddits.reject { |x| x.name == context.sub_reddit.name }

    subreddits = [context.sub_reddit] + subreddits

    collection_documents = []

    # initial document
    collection_documents << Document.new(content: context.sub_reddit.document, id: context.sub_reddit.id)

    subreddits.map do |reddit|
      collection_documents << Document.new(content: reddit.sub_reddit.document, id: reddit.id)
    end

    collection_documents.map! do |document|
      document unless document.content.delete(' ').empty?
    end
    collection_documents.select! { |x| !x.nil? }

    collection_documents.each do |doc|
      corpus << doc
    end

    corpus.similar_documents(collection_documents[0]).each do |doc, similarity|
      if collection_documents[0].id != doc.id
        RelatedSubReddit.create do |related_subreddit|
          related_subreddit.sub_reddit_id =  collection_documents[0].id # Origin
          related_subreddit.sub_reddit_relation_id = doc.id                     # relational doc
          related_subreddit.weight = similarity # weight
        end
      end
    end
  end
end
