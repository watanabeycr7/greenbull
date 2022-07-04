class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index

    #編集権限のないユーザーを取得
    @ordinaly_users = User.where(can_edit: false)

    #編集権限のあるユーザーを取得
    @editors = User.where(can_edit: true)

    #編集権限がなく、ユーザーグループ中間テーブルにIDが存在するユーザーを取得
    @users_in_group = @ordinaly_users.where(id: UserGroup.select(:user_id))

    #編集権限がなく、ユーザーグループ中間テーブルにもIDが存在しないユーザーを取得
    @users_not_in_group = @ordinaly_users.where.not(id: @users_in_group.ids)

    @groups = Group.all
  end

  def show
  end

  def edit
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
