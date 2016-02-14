Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        member do
          get '/tweets', to: 'users#tweets' # TODO: change route!
        end
      end
      resources :tweets, except: [:new, :edit]
    end
  end
end
