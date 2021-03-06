class Teammates::TeamController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
    @team = current_teammate.team
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    current_teammate.team = @team

    respond_to do |format|
      if @team.save
        current_teammate.save!
        format.html { redirect_to root_path, notice: I18n.t('tooltips.team_created') }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to root_path, notice: I18n.t('tooltips.team_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  protected

  def set_project
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
