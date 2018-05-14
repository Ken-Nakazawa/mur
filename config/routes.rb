Rails.application.routes.draw do
root 'pages#index'

get 'rakuten_search' => 'rakuten#search'
get "/tweets/search" => 'tweets#search'

get 'auth/:provider/callback' => 'users#create'#このpathを通して認証が行われる。
root 'home#top'
end
