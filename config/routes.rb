Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'auth',
                     path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, 
                     controllers: { sessions: 'sessions' }
  get '/' => 'home#index', as: :index

  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :reservations, only: [:create] do
        collection do
          get 'check_availability', to: 'reservations#check_availability'
        end
      end
    end
  end
end
