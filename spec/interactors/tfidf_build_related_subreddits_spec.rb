require 'rails_helper'
require 'awesome_print'

RSpec.describe TFIDFBuildRelatedSubreddits, type: :interactor do
  let(:doc1) { create(:sub_reddit, :ask_reddit) }
  let(:doc2) { create(:sub_reddit, :programming) }
  let(:subreddits) { SubReddit.all }

  subject(:context) do
    TFIDFBuildRelatedSubreddits.call(sub_reddit: doc1, sub_reddits: subreddits)
  end

  context 'when the parameters are valid' do
    let!(:doc1) { create(:sub_reddit, :ask_reddit) }
    let!(:doc2) { create(:sub_reddit, :programming) }

    let(:relations) do
      context.related_subreddits.each.each(&:save!)
      RelatedSubReddit.all
    end

    it { is_expected.to be_a_success }
    its(:message) { is_expected.to eq 'Related Sub Reddits Created' }
    it { expect(relations.first.weight).to eq 0.0108285703608455 }
  end

  context 'when the parameters are reversed' do
    let!(:doc2) { create(:sub_reddit, :ask_reddit) }
    let!(:doc1) { create(:sub_reddit, :programming) }

    let(:relations) do
      context.related_subreddits.each.each(&:save!)
      RelatedSubReddit.all
    end

    it { is_expected.to be_a_success }
    its(:message) { is_expected.to eq 'Related Sub Reddits Created' }
    it { expect(relations.first.weight).to eq 0.0108285703608455 }
  end
end
