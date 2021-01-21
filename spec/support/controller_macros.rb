module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryBot.create(:user)
      token = JsonWebToken.encode(user_id: user.id)
      request.headers.merge!({ "Authroziation": token })
    end
  end
end
