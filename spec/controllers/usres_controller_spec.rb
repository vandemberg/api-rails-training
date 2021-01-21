require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "# POST /users" do
    it "create with success" do
      post :create, {
        name: "vandemberg",
        email: "vandemberg.silva.lima@gmail.com",
        username: "vandemberg",
        password: "password",
        confirmation_password: "password",
      }

      expect(respose).to be_successful
    end

    it "users already exists" do
    end

    it "missing params" do
    end
  end
end
