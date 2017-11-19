Rails.application.routes.draw do
  devise_for :users
  resources :jobs

  namespace :admin do
    resources :jobs do
      member do
        post 'public'
        post 'hidden'
      end
    end
  end

  root "jobs#index"

end
