Rails.application.routes.draw do
  namespace :admins do
    resources :end_users, only:[:index, :show, :edit, :update]
    resources :goods
    resources :genres, only:[:index, :create, :edit, :update]
    get 'homes/top' => 'homes#top'
  end
  root to: 'admins/homes#top'
  
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
