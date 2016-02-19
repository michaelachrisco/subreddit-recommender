require 'rails_helper'
require 'awesome_print'

RSpec.describe BuildRelatedSubreddits, type: :interactor do
  let(:doc1) { create(:sub_reddit, :ask_reddit) }
  let(:doc2) { create(:sub_reddit, :programming) }
  let(:subreddits) { SubReddit.all }

  subject(:context) do
    BuildRelatedSubreddits.call(sub_reddit: doc1, sub_reddits: subreddits)
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
    # it { expect(relations.first.weight).to eq 0.726974374698307 }
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
    # it { expect(relations.first.weight).to eq 0.726974374698307 }
  end

  # context 'when relations have already been created' do
  #   let(:doc2) { create(:sub_reddit, :ask_reddit) }
  #   let(:doc1) { create(:sub_reddit, :programming) }
  #   let(:relations) do
  #     subject
  #     RelatedSubReddit.all
  #   end
  #
  # let(:context) do
  #   context = BuildRelatedSubreddits.call(sub_reddit: doc2, sub_reddits: subreddits)
  #   context.related_subreddits.flatten.each(&:save!)
  # end
  # subject do
  #   context
  #   BuildRelatedSubreddits.call(sub_reddit: doc1, sub_reddits: subreddits)
  # end
  #
  #   it { is_expected.to be_a_success }
  #   its(:message) { is_expected.to eq 'Related Sub Reddits Created' }
  #   it { expect(relations.size).to eq 1 }
  # end
end
