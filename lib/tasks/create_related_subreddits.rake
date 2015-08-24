require 'ruby-progressbar'
require 'thread/pool'

namespace :subreddits do
  desc 'Relates SubReddits via Simularity'
  task relate: :environment do
    # pool = Thread.pool(2)
    subreddits = SubReddit.all
    RelatedSubReddit.delete_all

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
# TODO: Create presentor for new relations. SubReddit.related_subreddits should return RelatedSubReddit.all_relations(SubReddit.find(id))
  desc 'Relates SubReddits via TFIDF'
  task relate_tfidf: :environment do
    pool = Thread.pool(1)
    limit_size = 4
    subreddits = SubReddit.all.first(limit_size)
    RelatedSubReddit.delete_all

    progress_bar = ProgressBar.create(title: 'subreddits:relate',
                                      smoothing: 0.6,
                                      starting_at: 0,
                                      total: (subreddits.size-1)*100,
                                      format: "%a %e %P% Building: %c from %C")
    increment = 0
    total = (subreddits.size-1)*limit_size
    subreddits.each do |sub_reddit|
            TFIDFCreateRelatedSubreddits.call(sub_reddit: sub_reddit, sub_reddits: subreddits)
          p "#{increment}:#{total}"
          increment += 2
    end
  end
end
