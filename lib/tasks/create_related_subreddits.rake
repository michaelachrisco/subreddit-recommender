require 'ruby-progressbar'

namespace :subreddits do
  desc 'Relates SubReddits'
  task relate: :environment do
    subreddits = SubReddit.all.first(500)
    RelatedSubReddit.all.each(&:destroy)
    progress_bar = ProgressBar.create(title: 'subreddits:seed',
                                      starting_at: 1,
                                      # :total => csv.size,
                                      total: subreddits.size,
                                      format: '%a %e %P% Processed: %c from %C')
    subreddits.each do |sub_reddit|
      CreateRelatedSubreddits.call(sub_reddit: sub_reddit)
      progress_bar.increment
    end
  end
end
