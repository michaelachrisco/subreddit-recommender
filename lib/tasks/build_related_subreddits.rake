require 'ruby-progressbar'
require 'thread/pool'

namespace :subreddits do
  desc 'Relates SubReddits'
  task relate: :environment do
    # pool = Thread.pool(2)
    subreddits = SubReddit.all
    RelatedSubReddit.all.each(&:destroy)

    related_subreddits = []
    # progress_bar = ProgressBar.create(title: 'subreddits:relate',
    #                                   smoothing: 0.6,
    #                                   starting_at: 0,
    #                                   total: subreddits.size,
                                      # format: "%a %e %P% Building: %c from %C")

    subreddits.each do |sub_reddit|
      p sub_reddit.name
      # pool.process do
        # context = BuildRelatedSubreddits.call(sub_reddit: sub_reddit, sub_reddits: subreddits)
        CreateRelatedSubreddits.call(sub_reddit: sub_reddit, sub_reddits: subreddits)
        # progress_bar.increment
        # related_subreddits << context.related_subreddits.flatten.each(&:save!)
      # end
    end
    # pool.shutdown

  end
end
