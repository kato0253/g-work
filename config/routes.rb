Rails.application.routes.draw do

  get 'address/show'
  root to: 'other_pages#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  devise_scope :user do
    get 'my_page', to: 'users/registrations#my_page', as: 'my_page'
  end

  resources :favorites, only: [:create, :destroy]

  resources :articles do
    collection do
      post :confirm
      patch :confirm
    end
  end

  resources :articles do
    member do
      post :confirm
      patch :confirm
    end
  end

  resources :articles do
    resources :comments
  end

end
