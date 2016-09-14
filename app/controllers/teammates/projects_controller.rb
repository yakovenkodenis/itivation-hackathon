class Teammates::ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to root_path, notice: I18n.t('tooltips.project_created') }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to root_path, notice: I18n.t('tooltips.project_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  protected

  def set_project
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :link, :description)
  end
end
