class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit]

  def index
    @user = current_user
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new

    #編集権限のないユーザーを取得
    @ordinaly_users = User.where(can_edit: false)
    #編集権限のあるユーザーを取得
    @editors = User.where(can_edit: true)
  end

  def create
    #まずスケジュールのみ作成
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    #その後ユーザーとの中間テーブルを作成。user_idsに含まれる空文字を除外してから、user_idひとつずつに@scheduleのidと紐付けたレコードを作成。
    user_schedules_params[:user_ids].compact_blank.each do |p|
      @schedule.user_schedules.create(user_id: p)
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end


  private

  def schedule_params
    params.require(:schedule).permit(:name, :start_date_and_time, :end_date_and_time, :place, :memo)
  end

  def user_schedules_params
    params.require(:schedule).require(:user_schedules).permit(user_ids: [])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
