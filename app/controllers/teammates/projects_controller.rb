class Teammates::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = current_teammate.team.projects.first
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    current_teammate.team.projects << @project

    respond_to do |format|
      if @project.save
        current_teammate.team.save!
        format.html { redirect_to team_index_path, notice: 'Project was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
