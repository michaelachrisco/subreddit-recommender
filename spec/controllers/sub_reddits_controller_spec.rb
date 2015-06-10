# require 'rails_helper'
#
# RSpec.describe SubRedditsController, type: :controller do
#   let(:valid_attributes) do
#     skip('Add a hash of attributes valid for your model')
#   end
#
#   let(:invalid_attributes) do
#     skip('Add a hash of attributes invalid for your model')
#   end
#
#   let(:valid_session) { {} }
#
#   describe 'GET #index' do
#     it 'assigns all sub_reddits as @sub_reddits' do
#       sub_reddit = SubReddit.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:sub_reddits)).to eq([sub_reddit])
#     end
#   end
#
#   describe 'GET #show' do
#     it 'assigns the requested sub_reddit as @sub_reddit' do
#       sub_reddit = SubReddit.create! valid_attributes
#       get :show, { id: sub_reddit.to_param }, valid_session
#       expect(assigns(:sub_reddit)).to eq(sub_reddit)
#     end
#   end
#
#   describe 'GET #new' do
#     it 'assigns a new sub_reddit as @sub_reddit' do
#       get :new, {}, valid_session
#       expect(assigns(:sub_reddit)).to be_a_new(SubReddit)
#     end
#   end
#
#   describe 'GET #edit' do
#     it 'assigns the requested sub_reddit as @sub_reddit' do
#       sub_reddit = SubReddit.create! valid_attributes
#       get :edit, { id: sub_reddit.to_param }, valid_session
#       expect(assigns(:sub_reddit)).to eq(sub_reddit)
#     end
#   end
#
#   describe 'POST #create' do
#     context 'with valid params' do
#       it 'creates a new SubReddit' do
#         expect do
#           post :create, { sub_reddit: valid_attributes }, valid_session
#         end.to change(SubReddit, :count).by(1)
#       end
#
#       it 'assigns a newly created sub_reddit as @sub_reddit' do
#         post :create, { sub_reddit: valid_attributes }, valid_session
#         expect(assigns(:sub_reddit)).to be_a(SubReddit)
#         expect(assigns(:sub_reddit)).to be_persisted
#       end
#
#       it 'redirects to the created sub_reddit' do
#         post :create, { sub_reddit: valid_attributes }, valid_session
#         expect(response).to redirect_to(SubReddit.last)
#       end
#     end
#
#     context 'with invalid params' do
#       it 'assigns a newly created but unsaved sub_reddit as @sub_reddit' do
#         post :create, { sub_reddit: invalid_attributes }, valid_session
#         expect(assigns(:sub_reddit)).to be_a_new(SubReddit)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, { sub_reddit: invalid_attributes }, valid_session
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
#       it 'updates the requested sub_reddit' do
#         sub_reddit = SubReddit.create! valid_attributes
#         put :update, { id: sub_reddit.to_param, sub_reddit: new_attributes }, valid_session
#         sub_reddit.reload
#         skip('Add assertions for updated state')
#       end
#
#       it 'assigns the requested sub_reddit as @sub_reddit' do
#         sub_reddit = SubReddit.create! valid_attributes
#         put :update, { id: sub_reddit.to_param, sub_reddit: valid_attributes }, valid_session
#         expect(assigns(:sub_reddit)).to eq(sub_reddit)
#       end
#
#       it 'redirects to the sub_reddit' do
#         sub_reddit = SubReddit.create! valid_attributes
#         put :update, { id: sub_reddit.to_param, sub_reddit: valid_attributes }, valid_session
#         expect(response).to redirect_to(sub_reddit)
#       end
#     end
#
#     context 'with invalid params' do
#       it 'assigns the sub_reddit as @sub_reddit' do
#         sub_reddit = SubReddit.create! valid_attributes
#         put :update, { id: sub_reddit.to_param, sub_reddit: invalid_attributes }, valid_session
#         expect(assigns(:sub_reddit)).to eq(sub_reddit)
#       end
#
#       it "re-renders the 'edit' template" do
#         sub_reddit = SubReddit.create! valid_attributes
#         put :update, { id: sub_reddit.to_param, sub_reddit: invalid_attributes }, valid_session
#         expect(response).to render_template('edit')
#       end
#     end
#   end
#
#   describe 'DELETE #destroy' do
#     it 'destroys the requested sub_reddit' do
#       sub_reddit = SubReddit.create! valid_attributes
#       expect do
#         delete :destroy, { id: sub_reddit.to_param }, valid_session
#       end.to change(SubReddit, :count).by(-1)
#     end
#
#     it 'redirects to the sub_reddits list' do
#       sub_reddit = SubReddit.create! valid_attributes
#       delete :destroy, { id: sub_reddit.to_param }, valid_session
#       expect(response).to redirect_to(sub_reddits_url)
#     end
#   end
# end
