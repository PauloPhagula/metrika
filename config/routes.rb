Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'main#index'

  namespace :api do
    namespace :v1 do
      match 'metric_names', to: 'metrics#names', via: :get
      resources :metrics do
      end
      match 'stats', to: 'stats#index', via: :get
    end
  end
end
