require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe "# POST /login" do
    it "returns user token" do
      user = FactoryBot.create(:user)
      post :login, params: { email: user.email, password: "password" }

      expect(response).to be_successful
      # expect(response.body.token)
    end

    it "returns 401 unauthorized" do
      user = FactoryBot.create(:user)
      post :login, params: { email: user.email, password: "wrong_password"}

      expect(response).to have_http_status(401)
    end
  end
end
