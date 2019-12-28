Rails.application.routes.draw do
  root 'stories#all'

  resources :articles, only: [:create, :destroy, :show, :update] do
    collection do
      get :search
      get :group
      get :count
      post :scaffold
    end
  end

  resources :stories, only: [:create, :destroy, :update] do
    collection do
      get :all
      get :search
      post :scaffold
    end
  end

  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
