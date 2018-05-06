Rails.application.routes.draw do
  
  get '/employee',  to: 'pages#employee'
  get '/manager',  to: 'pages#manager'
  get '/home', to: 'pages#home'
  
  root 'pages#home'
  
  resources :projects do
    resources :tasks 
  end
  devise_for :employees
end
