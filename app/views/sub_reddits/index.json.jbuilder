json.array!(@sub_reddits) do |sub_reddit|
  json.extract! sub_reddit, :id, :name, :url, :document, :bag_of_words
  json.url sub_reddit_url(sub_reddit, format: :json)
end
