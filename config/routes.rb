Rails.application.routes.draw do
  root 'questions#index'
  resources :questions, except: :index do
    post :answer, on: :member
  end
end
