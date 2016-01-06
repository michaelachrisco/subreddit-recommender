class SubRedditReport < ActiveRecord::Base
  has_many :sub_reddits, dependent: :destroy
end
