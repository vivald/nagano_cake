Rails.application.routes.draw do
  root to: 'admins/homes#top'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  
  devise_for :customers
  namespace :admins do
    get 'homes/top' => 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
