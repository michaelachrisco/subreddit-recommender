namespace :subreddits do
  desc 'Relates SubReddits'
  task relates: :environment do
    subreddits = SubReddit.all
    subreddits.each do |sub_reddit|
      CreateRelatedSubreddits.call(sub_reddit: sub_reddit)
    end
  end
end
