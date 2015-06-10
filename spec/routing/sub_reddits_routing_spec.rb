require 'rails_helper'

RSpec.describe SubRedditsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sub_reddits').to route_to('sub_reddits#index')
    end

    it 'routes to #new' do
      expect(get: '/sub_reddits/new').to route_to('sub_reddits#new')
    end

    it 'routes to #show' do
      expect(get: '/sub_reddits/1').to route_to('sub_reddits#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/sub_reddits/1/edit').to route_to('sub_reddits#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sub_reddits').to route_to('sub_reddits#create')
    end

    it 'routes to #update' do
      expect(put: '/sub_reddits/1').to route_to('sub_reddits#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/sub_reddits/1').to route_to('sub_reddits#destroy', id: '1')
    end
  end
end
