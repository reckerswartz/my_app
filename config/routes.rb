# frozen_string_literal: true

Rails.application.routes.draw do
  jsonapi_resources :urls
  jsonapi_resources :tags
  jsonapi_resources :contents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
