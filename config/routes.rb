Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :bookings 
  # resources :performances 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/performances/date' => 'performances#date'
  post '/performances/date' => 'performances#date_create'
  get '/performances/time' => 'performances#time', as: "performance_time"
  post '/performances/time' => 'performances#time_create'
  post '/logout' => 'sessions#destroy'
  get '/search' => 'pages#search', :as => 'search_page'
  resources :events
  resources :theatres
end
