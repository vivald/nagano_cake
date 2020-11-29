Rails.application.routes.draw do
  namespace :admins do
    resources :goods
  end
  root to: 'admins/homes#top'
  
  resources :items, only:[:index, :create, :show]

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  
  devise_for :customers
  namespace :admins do
    get 'homes/top' => 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
