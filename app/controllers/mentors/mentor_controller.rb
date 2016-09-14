class Mentors::MentorController < ApplicationController
  def index
    puts 'SHIIIIIIIIIIIIIIT INDEX'
    @mentor = current_mentor
  end
end
