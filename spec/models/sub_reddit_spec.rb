require 'rails_helper'

RSpec.describe SubReddit, type: :model do
    it { should have_many(:related_sub_reddits) }
    it { should belong_to(:sub_reddit_report) }
end
