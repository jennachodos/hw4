class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    # find current user who is logged in & create variable
    @current_user = User.find_by({ "id" => session["user_id"] })
  end
end
