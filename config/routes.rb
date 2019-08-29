Rails.application.routes.draw do

  devise_for :users ,:controllers => { :registrations => "registrations" }
  resources :articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  # get 'signup', to: 'users#new'
  # get  'login',  to: 'sessions#new'
  # post 'login',  to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
  resources :users, except:[:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
