require 'rails_helper'

RSpec.describe SubRedditReport, type: :model do
  it { should have_many(:sub_reddits) }
end
