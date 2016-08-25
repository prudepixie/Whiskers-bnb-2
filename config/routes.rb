Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :hosts
  resources :users
  scope '/api' do
     mount_devise_token_auth_for 'User', at: '/auth'
     resources :groups, except: [:new, :edit]
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
