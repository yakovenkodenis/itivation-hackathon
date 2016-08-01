class Teammates::TeamController < ApplicationController
  def index
    if !current_teammate.team
      if params[:create_new]
        redirect_to action: 'create'
      else
        # current_teammate.team = Team.find(params[:team_id])
      end
    end
  end

  def create
    # @team = Team.new
  end
end
