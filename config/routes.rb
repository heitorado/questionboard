Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'home/index'
  get 'questions/answered' => 'questions#answered'
  get 'questions/pending'=> 'questions#pending'
  resources :users, only: [:edit, :update]
  resources :questions do
    member do
      get 'answer'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
