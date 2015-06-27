require 'awesome_print'
require 'ruby-progressbar'

namespace :subreddits do
  desc 'Seeds SubReddits'
  task seed: :environment do
    SubReddit.all.each(&:destroy)
    RelatedSubReddit.all.each(&:destroy)
    require 'csv'
    path = "#{Rails.root}/lib/tasks/all_subreddits.csv"
    # ap path
    csv_text = File.read(path)
    csv = CSV.parse(csv_text, headers: false)
    # ap csv
    csv.map! do |_key, value|
      value.to_sym
    end
    puts "#{csv.size} tables"
    message = ''
    # csv.first(20).each do |sub_reddit_sym|
    progress_bar = ProgressBar.create(title: 'subreddits:seed',
                                      starting_at: 0,
                                      total: csv.size,
                                      # :total => 100,
                                      format: "%a %e %P% Processed: %c from %C #{message}")
    csv.first(200).each do |sub_reddit_sym|
      url = "http://reddit.com/r/#{sub_reddit_sym}.json"
      sub_reddit = SubReddit.new(name: sub_reddit_sym.to_s.titleize, url: url)
      # puts sub_reddit.inspect
      context = CreateSubreddit.call(sub_reddit: sub_reddit) rescue []
      if context == []
        puts = "#{sub_reddit_sym} FAIL"
      else
        message = context.message
      end
      # puts context.message unless context == []
      # puts "#{sub_reddit_sym} FAIL" if context == []
      # sub_reddit.save
      progress_bar.increment
      sleep(1.5)
    end
  end
end
