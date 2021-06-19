Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'pages#index'

namespace :api do
  namespace :v1 do 
    resources :airlines, param: :slug
    resources :reviews, only: [:create, :destroy]
  end
end

# routes requests that aren't for existing paths predefined in our api, 
# back to our index path

get '*path', to: 'pages#index', via: :all

end
