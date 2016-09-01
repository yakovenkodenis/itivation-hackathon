class HomeController < ApplicationController
  def index
    @mentors = Mentor.all
    @mentors_count = @mentors.size
  end

  def teams
    @teams = Team.all
  end

  def mentors
    @mentors = Mentor.all
  end
end
