Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :quotes do
    resource :like, only: [:create, :destroy]
  end

  root "quotes#index"
end
