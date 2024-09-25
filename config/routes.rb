# frozen_string_literal: true

Rails.application.routes.draw do
  get 'drivers/signup'
  get 'drivers/login'

  get 'trucks/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")/
  # root "articles#index"
end
