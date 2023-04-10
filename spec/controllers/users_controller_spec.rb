require 'rails_helper'

describe UsersController, type: :controller do

  before do
    #need to change email to be unique
    @user = User.create(name: 'User', email: 'papapa@papa.com')
  end




  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new User" do
      expect {
        post :create, params: { user: { name: 'User', email: 'user@email.com' } }
      }.to change(User, :count).by(1)
    end

    it "redirects to the created user" do
      post :create, params: { user: { name: 'User', email: 'user@email.com' } }
      expect(response).to redirect_to(user_path(User.last))
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit,  params: {id: @user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "updates the requested user" do
      patch :update, params: {id: @user.id, user: { name: 'UserChange', email: 'ChangedEmail@email.com' } }
      @user.reload
      expect(@user.name).to eq('UserChange')
      expect(@user.email).to eq('ChangedEmail@email.com')
    end

    it "redirects to the user" do
      patch :update, params: {id: @user.id, user: { name: 'UserChange', email: 'ChangedEmail@email.com' } }
      expect(response).to redirect_to(user_path(@user))
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, params: {id: @user.id}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, params: {id: @user.id}
      expect(response).to redirect_to(users_path)
    end
  end
end