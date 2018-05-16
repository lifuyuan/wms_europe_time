Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home/welcome', to: 'home#welcome', as: :welcome

  # 用户登录相关
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  # 用户注册相关
  resources :users
end
