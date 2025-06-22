Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      resources :courses, only: [:create, :index]
    end
  end
end
