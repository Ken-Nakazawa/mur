Rails.application.routes.draw do
root 'pages#index'

get 'rakuten_search' => 'rakuten#search'
get "/tweets/search" => 'tweets#search'
end
