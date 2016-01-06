require 'rails_helper'

RSpec.describe SubReddit, type: :model do
    it { should have_many(:related_sub_reddits) }
    # has_many :related_sub_reddits, dependent: :destroy
  # pending "add some examples to (or delete) #{__FILE__}"
end
