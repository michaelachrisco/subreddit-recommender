class CreateSubreddit
  include Interactor
  before :document

  def call
    persist!
    context.message = "#{context.sub_reddit.name} Subreddit created"
  end

  def document
    begin
      bag = RedditBagOfWords::Client.new(context.sub_reddit.url)
    rescue
      retry
      context.fail!(message: 'subreddit lookup fail')
    end
    set_subreddit(bag)
  end

  def set_subreddit(bag)
    return unless bag
    # context.sub_reddit.document = bag.try(:descriptions_string_bag)
    # context.sub_reddit.bag_of_words = bag.try(:descriptions_bag)
    context.sub_reddit.document = bag.try(:titles_string_bag)
    context.sub_reddit.bag_of_words = bag.try(:titles_bag)
  end

  def persist!
    return context.message = 'Empty subreddit' if \
    context.sub_reddit.document.empty?
    || context.sub_reddit.bag_of_words.empty?
    context.sub_reddit.save!
  end
end
