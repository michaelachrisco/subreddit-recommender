require 'rails_helper'

RSpec.describe SubRedditReport, type: :model do
    # has_many :related_sub_reddits, dependent: :destroy
  it { should have_many(:sub_reddits) }
  it { should belong_to(:sub_reddit_report)}
end
