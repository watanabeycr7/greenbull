class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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

  def update
    #まずユーザーを更新
    @user.update(user_params)
    #ユーザーがもつグループ情報を一旦すべて削除
    @user.user_groups.destroy_all
    #group_idを登録して保存
    @user.user_groups.create(user_group_params)
    redirect_to user_path(params[:id])
  end

  #管理者が利用者情報を削除する機能、ユーザー自身の削除はdeviseで行うこと。
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def user_group_params
    params.require(:user).require(:user_groups).permit(:group_id)
  end
end
