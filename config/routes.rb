Rails.application.routes.draw do
  

  root to: 'admin/homes#top'
  
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :edit]
    get 'homes/top' => 'homes#top'
  end
  
  namespace :public do
    resources :customers, only:[:show, :edit, :update]
    resources :delivery_statuses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show, :update]
    resources :items, only:[:index, :show]
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
