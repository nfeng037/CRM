Rails.application.routes.draw do
  root "articles#index"

  get "/customers", to: "customers#index"
end
