Rails.application.routes.draw do
  devise_for :users
  root to: "travels#index"
  resources :bookmarks, only: [:index, :new, :edit]
  get '/roulette', to: 'roulette#index'
   # フォームデータの保存
   post '/save-form-data', to: 'bookmarks#save_form_data', as: 'save_form_data'
  get "/p5.min.js", to: redirect("/assets/p5.min.js")
get "/app.js", to: redirect("/assets/app.js")
end
