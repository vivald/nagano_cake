Rails.application.routes.draw do


  root to: 'public/homes#top'

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :edit]
    get 'homes/top' => 'homes#top'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/confirm' => 'customers#update_leave'
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :index, :show, :create]
    resources :items, only:[:index, :show]
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
      end
  end

  devise_for :admin, controllers: {
  sessions: 'admin/sessions',
  registrations: 'admin/registrations'
}

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
