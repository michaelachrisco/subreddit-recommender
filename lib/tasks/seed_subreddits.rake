namespace :subreddits do
  desc 'Seeds SubReddits'
  task seeds: :environment do
    SubReddit.all.each(&:destroy)
    subreddits = [:programming, :ask_reddit, :all, :pc_master_race]
    subreddits.each do |sub_reddit_sym|
      puts sub_reddit_sym
      url = "http://reddit.com/r/#{sub_reddit_sym}.json"
      sub_reddit = SubReddit.create(name: sub_reddit_sym.to_s.titleize, url: url)
      # puts sub_reddit.inspect
      CreateSubreddit.call(sub_reddit: sub_reddit)
      sub_reddit.save!
    end
  end
end
