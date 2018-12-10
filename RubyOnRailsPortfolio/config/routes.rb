Rails.application.routes.draw do
  get '/home'
  get '/about'
  get '/contact'
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
