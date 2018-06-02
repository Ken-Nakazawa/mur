Rails.application.routes.draw do
  get 'favorites/index'

  get 'sessions/new'

  post "/" => "pages#index"
  root 'pages#index'

  post 'rakuten_search' => 'rakuten#search'
  get 'rakuten_search' => 'rakuten#search'
  get "/tweets/search" => 'tweets#search'


  get 'auth/:provider/callback' => 'users#create'#このpathを通して認証が行われる。
  root 'home#top'

  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
end
