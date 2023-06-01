class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    #save 1-way encrypted has of password using BCrypt
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/login"
  end
end
