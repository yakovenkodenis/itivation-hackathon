Rails.application.routes.draw do

  devise_for :mentors
  devise_for :teammates
end
