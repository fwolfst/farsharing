class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: [:show]

  def index
    @pagy, @users = pagy(User, items: 10)
    authorize!
  end

  def show
    authorize! @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
