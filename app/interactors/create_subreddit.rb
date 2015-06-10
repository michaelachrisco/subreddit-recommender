class CreateSubreddit
  include Interactor
  before :document

  def call
    object = SubReddit.find_or_create_by(name: context.sub_reddit.name)
    object.save!
    context.message = 'Subreddit created'
  end

  def document
    bag = RedditBagOfWords::Client.new(context.sub_reddit.url)
    context.sub_reddit.document = bag.string_bag
    context.sub_reddit.bag_of_words = bag.bag
  end
end
