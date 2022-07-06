class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit]
  # before_action :set_groups, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    
    schedules_in_group = Schedule.where(id: GroupSchedule.select(:schedule_id))
    @schedules_not_in_group = Schedule.where.not(id: schedules_in_group.ids)

    @groups = Group.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    #まずスケジュールのみ作成
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    #その後ユーザーとの中間テーブルを作成。user_idsに含まれる空文字を除外してから、user_idひとつずつに@scheduleのidと紐付けたレコードを作成。
    user_schedules_params[:user_ids].compact_blank.each do |p|
      @schedule.user_schedules.create(user_id: p)
    end
    #ユーザーと同じことをグループでも行う。
    group_schedules_params[:group_ids].compact_blank.each do |p|
      @schedule.group_schedules.create(group_id: p)
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    #まずスケジュールを更新
    @schedule.update(schedule_params)
    #スケジュールがもつユーザー情報を一旦すべて削除
    @schedule.user_schedules.destroy_all
    #user_idを再登録。user_idsに含まれる空文字を除外してから、user_idひとつずつに@scheduleのidと紐付けたレコードを作成。
    user_schedules_params[:user_ids].compact_blank.each do |p|
      @schedule.user_schedules.create(user_id: p)
    end
    #ユーザーと同じことをグループでも行う。
    @schedule.group_schedules.destroy_all
    group_schedules_params[:group_ids].compact_blank.each do |p|
      @schedule.group_schedules.create(group_id: p)
    end
    redirect_to schedule_path(params[:id])
  end

  def destroy
    @schedule.destroy
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :start_date_and_time, :end_date_and_time, :place, :memo)
  end

  def user_schedules_params
    params.require(:schedule).require(:user_schedules).permit(user_ids: [])
  end

  def group_schedules_params
    params.require(:schedule).require(:group_schedules).permit(group_ids: [])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_users
    #編集権限のないユーザーを取得
    @ordinaly_users = User.where(can_edit: false)
    #編集権限のあるユーザーを取得
    @editors = User.where(can_edit: true)
  end
end
