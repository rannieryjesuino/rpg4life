Rails.application.routes.draw do
  resources :choices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players, only: [:new, :create, :edit, :update, :destroy, :index]
  post "/players/:id/edit" => "players#edit"
  get "players/busca" => "players#busca", as: "busca_player"

  resources :sessions, only: [:new, :create, :destroy]
  get "/sessions/list" => "sessions#list", as: "sessions_list"

  resources :attendances, only: [:edit, :update, :destroy, :create]
  post "/attendances/:player_id/:session_id/new" => "attendances#new"
  get "/attendances/:player_id/:session_id/new" => "attendances#new", as: "new_attendance"
  post "/attendances/:id/edit" => "attendances#edit"

  root "sessions#index"



end
