Rails.application.routes.draw do
  
  root to: 'admins/homes#top'
  
  namespace :admins do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :goods
    resources :genres, only:[:index, :create, :edit, :update]
    get 'homes/top' => 'homes#top'
  end
  
  namespace :public do
    resources :customers, only:[:show, :edit, :update]
    resources :delivery_statuses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show, :update]
  end
  
  resources :items, only:[:index, :create, :show]

  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
