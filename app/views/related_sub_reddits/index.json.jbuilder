json.array!(@related_sub_reddits) do |related_sub_reddit|
  json.extract! related_sub_reddit, :id, :sub_reddit, :weight, :sub_reddit_relation
  json.url related_sub_reddit_url(related_sub_reddit, format: :json)
end
