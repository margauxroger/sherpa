Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :dashboard do
  #   resources :users, only: %i[show edit update]
  #   resources :teacher_divisions, only: %i[show]
  #   resources :flashcards
  #   resources :forums
  #   resources :messages
  # end


  namespace :teachers do
    root to: 'teachers#show'
      resources :courses, only: [:show] do
        resources :students, only: [:index, :show]
    end
    resources :flashcards, only: [:index]
  end
  resources :materials, only: [:index, :show]
  resources :chapters, only: [:new, :create, :edit, :update, :destroy]
  resources :courses, only: [:show] do
    resources :flashcards, only: [:create, :update, :destroy]
  end

  resources :forums, only: [:create, :update, :show] do
    resources :messages, only: [:create, :show]
  end

  namespace :students do
    root to: 'students#show'
      resources :courses, only: [:show] do
        resources :feedbacks, only: [:create, :update, :delete]
    end
  end

  get '/flashcards_notifications', to: 'teachers/teachers#trigger_flashcard_notifications', as: 'flashcards_notifications'

end
