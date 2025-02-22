Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  get "home/index"
  get "home/introduction", to: "home#introduction", as: :home_introduction
  get "home/services", to: "home#services", as: :home_services
  get "home/contact", to: "home#contact", as: :home_contact
  get "home/request_programmer", to: "home#request_programmer", as: :home_request_programmer
  patch "tasks/:id/mark_as_done", to: "tasks#mark_as_done", as: :mark_as_done_task
  patch "tasks/:id/mark_as_pending", to: "tasks#mark_as_pending", as: :mark_as_pending_task
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
