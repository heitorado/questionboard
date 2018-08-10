Rails.application.routes.draw do
  get 'home/index'
  resources :users
  resources :questions do
    member do
      get 'answer'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
