require 'rails_helper'

RSpec.describe CreateRelatedSubreddits, type: :interactor do
  let(:doc1) { create(:sub_reddit, :ask_reddit) }
  let(:doc2) { create(:sub_reddit, :programming) }

  subject(:context) do
    CreateRelatedSubreddits.call(sub_reddit: doc1)
  end

  context 'when the parameters are valid' do
    let!(:doc1) { create(:sub_reddit, :ask_reddit) }
    let!(:doc2) { create(:sub_reddit, :programming) }
    let(:relations) do
      context
      RelatedSubReddit.all
    end

    it { is_expected.to be_a_success }
    its(:message) { is_expected.to eq 'Related Sub Reddits Created' }
    it { expect(relations.first.weight).to eq 0.726974374698307 }
  end

  context 'when the parameters are reversed' do
    let!(:doc2) { create(:sub_reddit, :ask_reddit) }
    let!(:doc1) { create(:sub_reddit, :programming) }
    let(:relations) do
      context
      RelatedSubReddit.all
    end

    it { is_expected.to be_a_success }
    its(:message) { is_expected.to eq 'Related Sub Reddits Created' }
    it { expect(relations.first.weight).to eq 0.7269743746983072 }
  end
end
