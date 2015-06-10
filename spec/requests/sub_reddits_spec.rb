require 'rails_helper'

RSpec.describe 'SubReddits', type: :request do
  describe 'GET /sub_reddits' do
    it 'works! (now write some real specs)' do
      get sub_reddits_path
      expect(response).to have_http_status(200)
    end
  end
end
