class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email"=> params["email"]})
    #authenticate the user by username and password
    #if username and password match, login and redirect to places
    if @user 
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hello."
        redirect_to "/places"
      #if password is incorrect, redirect to login
      else 
        flash["notice"] = "Incorrect Password."
        redirect_to "/login"
      end
    #if user not found, redirect to login
    else
      flash["notice"] = "User not found."
      redirect_to "/login"
    end
  end

  #logout a logged-in user
  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    #redirect to login
    redirect_to "/login"
  end
end
  