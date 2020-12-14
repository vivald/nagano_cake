Rails.application.routes.draw do

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  root to: 'admin/homes#top'

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :edit]
    get 'homes/top' => 'homes#top'
  end
  namespace :public do
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/confirm' => 'customers#update_leave'
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    resources :addresses, only:[:index, :edit, :update, :destroy]
    resources :orders, only:[:new, :index, :show, :create]
    resources :items, only:[:index, :show]
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
      end
  end

  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
