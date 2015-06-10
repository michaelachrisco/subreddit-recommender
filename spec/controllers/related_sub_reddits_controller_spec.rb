# require 'rails_helper'
#
# RSpec.describe RelatedSubRedditsController, type: :controller do
#   let(:valid_attributes) do
#     # skip('Add a hash of attributes valid for your model')
#   end
#
#   let(:invalid_attributes) do
#     # skip('Add a hash of attributes invalid for your model')
#   end
#
#   let(:valid_session) { {} }
#
#   describe 'GET #index' do
#     it 'assigns all related_sub_reddits as @related_sub_reddits' do
#       related_sub_reddit = RelatedSubReddit.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:related_sub_reddits)).to eq([related_sub_reddit])
#     end
#   end
#
#   describe 'GET #show' do
#     it 'assigns the requested related_sub_reddit as @related_sub_reddit' do
#       related_sub_reddit = RelatedSubReddit.create! valid_attributes
#       get :show, { id: related_sub_reddit.to_param }, valid_session
#       expect(assigns(:related_sub_reddit)).to eq(related_sub_reddit)
#     end
#   end
#
#   describe 'GET #new' do
#     it 'assigns a new related_sub_reddit as @related_sub_reddit' do
#       get :new, {}, valid_session
#       expect(assigns(:related_sub_reddit)).to be_a_new(RelatedSubReddit)
#     end
#   end
#
#   describe 'GET #edit' do
#     it 'assigns the requested related_sub_reddit as @related_sub_reddit' do
#       related_sub_reddit = RelatedSubReddit.create! valid_attributes
#       get :edit, { id: related_sub_reddit.to_param }, valid_session
#       expect(assigns(:related_sub_reddit)).to eq(related_sub_reddit)
#     end
#   end
#
#   describe 'POST #create' do
#     context 'with valid params' do
#       it 'creates a new RelatedSubReddit' do
#         expect do
#           post :create, { related_sub_reddit: valid_attributes }, valid_session
#         end.to change(RelatedSubReddit, :count).by(1)
#       end
#
#       it 'assigns a newly created related_sub_reddit as @related_sub_reddit' do
#         post :create, { related_sub_reddit: valid_attributes }, valid_session
#         expect(assigns(:related_sub_reddit)).to be_a(RelatedSubReddit)
#         expect(assigns(:related_sub_reddit)).to be_persisted
#       end
#
#       it 'redirects to the created related_sub_reddit' do
#         post :create, { related_sub_reddit: valid_attributes }, valid_session
#         expect(response).to redirect_to(RelatedSubReddit.last)
#       end
#     end
#
#     context 'with invalid params' do
#       it 'assigns a newly created but unsaved related_sub_reddit as @related_sub_reddit' do
#         post :create, { related_sub_reddit: invalid_attributes }, valid_session
#         expect(assigns(:related_sub_reddit)).to be_a_new(RelatedSubReddit)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, { related_sub_reddit: invalid_attributes }, valid_session
#         expect(response).to render_template('new')
#       end
#     end
#   end
#
#   describe 'PUT #update' do
#     context 'with valid params' do
#       let(:new_attributes) do
#         skip('Add a hash of attributes valid for your model')
#       end
#
#       it 'updates the requested related_sub_reddit' do
#         related_sub_reddit = RelatedSubReddit.create! valid_attributes
#         put :update, { id: related_sub_reddit.to_param, related_sub_reddit: new_attributes }, valid_session
#         related_sub_reddit.reload
#         skip('Add assertions for updated state')
#       end
#
#       it 'assigns the requested related_sub_reddit as @related_sub_reddit' do
#         related_sub_reddit = RelatedSubReddit.create! valid_attributes
#         put :update, { id: related_sub_reddit.to_param, related_sub_reddit: valid_attributes }, valid_session
#         expect(assigns(:related_sub_reddit)).to eq(related_sub_reddit)
#       end
#
#       it 'redirects to the related_sub_reddit' do
#         related_sub_reddit = RelatedSubReddit.create! valid_attributes
#         put :update, { id: related_sub_reddit.to_param, related_sub_reddit: valid_attributes }, valid_session
#         expect(response).to redirect_to(related_sub_reddit)
#       end
#     end
#
#     context 'with invalid params' do
#       it 'assigns the related_sub_reddit as @related_sub_reddit' do
#         related_sub_reddit = RelatedSubReddit.create! valid_attributes
#         put :update, { id: related_sub_reddit.to_param, related_sub_reddit: invalid_attributes }, valid_session
#         expect(assigns(:related_sub_reddit)).to eq(related_sub_reddit)
#       end
#
#       it "re-renders the 'edit' template" do
#         related_sub_reddit = RelatedSubReddit.create! valid_attributes
#         put :update, { id: related_sub_reddit.to_param, related_sub_reddit: invalid_attributes }, valid_session
#         expect(response).to render_template('edit')
#       end
#     end
#   end
#
#   describe 'DELETE #destroy' do
#     it 'destroys the requested related_sub_reddit' do
#       related_sub_reddit = RelatedSubReddit.create! valid_attributes
#       expect do
#         delete :destroy, { id: related_sub_reddit.to_param }, valid_session
#       end.to change(RelatedSubReddit, :count).by(-1)
#     end
#
#     it 'redirects to the related_sub_reddits list' do
#       related_sub_reddit = RelatedSubReddit.create! valid_attributes
#       delete :destroy, { id: related_sub_reddit.to_param }, valid_session
#       expect(response).to redirect_to(related_sub_reddits_url)
#     end
#   end
# end
