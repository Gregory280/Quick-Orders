Rails.application.routes.draw do
  get 'kitchen/index'
  get 'kitchen/view_order/:id', to: 'kitchen#view_order', as: 'kitchen_view_order'
  post 'kitchen/report_status/:id', to: 'kitchen#report_status', as: 'kitchen_report_status'
  resources :orders do
    post :report_status, on: :member
  end
  devise_for :users
  resources :categories
  resources :products
  resources :users
  root to: 'home#index'
end
