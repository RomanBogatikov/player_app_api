Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users
  resources :ledgers
  resources :playlists
  resources :songs, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
