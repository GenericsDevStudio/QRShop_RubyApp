Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :users, only: [:index, :create]
  resources :goods, only: [:index, :new, :create]
  get 'goods/edit', to: 'goods#edit'
  post 'goods/refresh', to: 'goods#refresh', as: 'goods_refresh'
  get 'goods/remove', to: 'goods#remove'

  get 'users/log_in', to: 'users#log_in'
  get 'users/log_out', to: 'users#log_out'
end
