require 'rails_helper'

RSpec.describe RelatedSubReddit, type: :model do
  it { should belong_to(:sub_reddit) }
end
