require 'rails_helper'

RSpec.describe CreateSubreddit, type: :interactor do
  let(:sub_reddit) { create(:sub_reddit, :ask_reddit) }

  subject(:context) do
    CreateSubreddit.call(sub_reddit: sub_reddit)
  end

  let(:sub_reddits) do
    context
    SubReddit.all
  end

  context 'when the parameters are valid' do
    it { is_expected.to be_a_success }
    its(:message) { is_expected.to eq 'Subreddit created' }
    it { expect(sub_reddits.first.document).not_to be '' }
    it { expect(sub_reddits.first.bag_of_words).not_to be '' }
  end
end
