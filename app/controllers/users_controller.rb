class UsersController < ApplicationController
  def my_profile
    @user = current_user
  end
end
