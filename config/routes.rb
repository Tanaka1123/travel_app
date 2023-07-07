Rails.application.routes.draw do
  devise_for :users
  root to: "travels#index"
  resources :bookmarks, only: [:index, :new, :create]
  get '/roulette', to: 'roulette#index'

  get "/p5.min.js", to: redirect("/assets/p5.min.js")
get "/app.js", to: redirect("/assets/app.js")
end
