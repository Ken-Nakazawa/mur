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

  resources 'users'
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
end
