Rails.application.routes.draw do
  resources :users, only: [:new, :show, :index, :create]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
