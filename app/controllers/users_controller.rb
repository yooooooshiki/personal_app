class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all
  end
  def show
    user = User.find(params[:id])
    # @favorites = Favorite.where("user_id = ?", @user)
  end
end
