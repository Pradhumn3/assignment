Rails.application.routes.draw do
  resources :products
  post '/add_items', to: 'products#add_items'
  post '/add_to_cart', to: 'products#add_to_cart'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
