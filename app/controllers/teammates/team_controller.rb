class Teammates::TeamController < ApplicationController
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
        format.html { redirect_to team_index_path, notice: 'Team was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def team_params
    params.require(:team).permit(:id, :name)
  end
end
