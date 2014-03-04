Hockey::Application.routes.draw do

  get "static_pages/page1"

  get "static_pages/page2"

  get "static_pages/page3"

  resources :articles

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end