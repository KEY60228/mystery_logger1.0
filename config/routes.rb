Rails.application.routes.draw do
  post "wannas/:performance_id/create" => "wannas#create"
  post "wannas/:performance_id/destroy" => "wannas#destroy"

  post "dones/:performance_id/create" => "dones#create"
  post "dones/:performance_id/destroy" => "dones#destroy"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "users/index" => "users#index"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "users/:id/done" => "users#done"
  get "users/:id/wanna" => "users#wanna"
  get "users/:id" => "users#done"

  get "performances/index" => "performances#index"
  get "performances/:id" => "performances#show"

  get "/" => "home#top"
  get "about" => "home#about"
end
