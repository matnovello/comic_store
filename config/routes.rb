Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    #index
    get "/comic_store" => "comic_store#index"
    #show
    get "/comic_store/:id" => "comic_store#show"
    #update
    patch "/comic_store/:id" => "comic_store#patch"
  end
end
