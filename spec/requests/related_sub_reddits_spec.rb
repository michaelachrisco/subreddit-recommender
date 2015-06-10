require 'rails_helper'

RSpec.describe 'RelatedSubReddits', type: :request do
  describe 'GET /related_sub_reddits' do
    it 'works! (now write some real specs)' do
      get related_sub_reddits_path
      expect(response).to have_http_status(200)
    end
  end
end
