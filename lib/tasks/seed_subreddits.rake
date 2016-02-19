require 'awesome_print'
require 'ruby-progressbar'
require 'thread/pool'

# Change so that every 100 is put into the memory instead of active record.
namespace :subreddits do
  desc 'Seeds SubReddits'
  task seed: :environment do
    pool = Thread.pool(20)

    require 'csv'
    path = "#{Rails.root}/lib/tasks/all_subreddits.csv"

    csv_text = File.read(path)
    csv = CSV.parse(csv_text, headers: false)
    limit_size = 100
    # limit_size = csv.size
    
    to_ignore = ['photos', 'hackers']


    csv.map! do |_key, value|
      value.to_sym
    end
    p "#{csv.size} tables"
    subreddits = []

    #progress_bar = ProgressBar.create(title: 'subreddits:seed',
    #                                  starting_at: 0,
    #                                   total: limit_size,
    #                                  format: '%a %e %P% Processed: %c from %C')

    report = SubRedditReport.create(status: :start);
    csv.first(limit_size).each do |sub_reddit_sym|
      #pool.process do
        sub_reddit_name = sub_reddit_sym.to_s
        url = "http://reddit.com/r/#{sub_reddit_sym}.json"
        if to_ignore.include?(sub_reddit_name)
          p "ignoring #{url}"
          #progress_bar.increment
        else
          p "getting #{url}"
          sub_reddit = SubReddit.new(name: sub_reddit_name.titleize, url: url, sub_reddit_report_id: report.id)

          context = BuildSubreddit.call(sub_reddit: sub_reddit)
          subreddits << context.sub_reddit if context.success?
          #progress_bar.increment
          sleep Random.rand(2...5)
        end
      #end
    end

    pool.shutdown
    p 'saving'
    subreddits.each(&:save!)
    report.update(status: :seeded)
  end
end
