class Mentors::MentorController < ApplicationController
  def index
    @mentor = current_mentor
  end
end
