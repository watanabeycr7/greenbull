class UsersController < ApplicationController

  def index
    @ordinaly_users = User.where(can_edit: false)
    @groups = Group.all
  end
  def show
    @user = User.find(params[:id])
  end
end
