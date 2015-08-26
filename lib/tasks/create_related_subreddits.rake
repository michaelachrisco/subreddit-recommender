require 'ruby-progressbar'
require 'thread/pool'

namespace :subreddits do
  desc 'Relates SubReddits via Simularity'
  task relate: :environment do
    pool = Thread.pool(2)
    limit_size = 250
    # subreddits = SubReddit.all.first(limit_size)
    subreddits = SubReddit.all.shuffle.first(limit_size)
    RelatedSubReddit.delete_all

    related_subreddits = []
    progress_bar = ProgressBar.create(title: 'subreddits:relate',
                                      smoothing: 0.6,
                                      starting_at: 0,
                                      total: limit_size,
                                      format: "%a %e %P% Building: %c from %C")

    subreddits.each do |sub_reddit|
      pool.process do
        CreateRelatedSubreddits.call(sub_reddit: sub_reddit, sub_reddits: subreddits)
        progress_bar.increment
      end
    end
    pool.shutdown

  end

  desc 'Relates SubReddits via TFIDF'
  task relate_tfidf: :environment do
    limit_size = SubReddit.all.size/2
    subreddits = SubReddit.all.first(limit_size)
    RelatedSubReddit.delete_all
            TFIDFCreateRelatedSubreddits.call(sub_reddit: subreddits[0], sub_reddits: subreddits)
  end
end
