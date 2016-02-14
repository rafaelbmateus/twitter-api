Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :tweets, except: [:new, :edit]
    end
  end
end
