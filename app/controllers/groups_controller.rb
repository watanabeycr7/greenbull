class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to groups_path
  end

  def show
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to group_path(@group.id)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end

end
