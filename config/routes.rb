Rails.application.routes.draw do
  devise_for :users
  root to: "games#index"
  resources :games do
    resources :bookings, only: %i[new create destroy]
  end

  get 'dashboard', to: "pages#dashboard"
end
