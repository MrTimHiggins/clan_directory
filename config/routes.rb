Rails.application.routes.draw do
  root to: "welcome#home"

  devise_for :users

  resources :family_members

  match 'calendar', to: 'calendars#show', via: [:get]
end
