class HomeController < ApplicationController
  def index
  end

  def teams
    @teams = Team.all
  end

  def mentors
    @mentors = Mentor.all
  end
end
