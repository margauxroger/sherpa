Rails.application.routes.draw do
  # mount ActionCable.server => "/cable"

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
    resources :flashcards, only: [:index, :destroy, :update, :create]
    resources :feedbacks, only: [:index]
  end
  resources :materials, only: [:index, :show]
  resources :chapters, only: [:new, :create, :edit, :update, :destroy] do
    resources :flashcards, only: [:index, :show, :create]
  end
  resources :courses, only: [:show]

  resources :forums, only: [:create, :update, :show] do
    resources :messages, only: [:create, :show]
  end

  namespace :students do
    root to: 'courses#index'
      resources :students, only: [:index, :show]
      resources :courses, only: [:index, :show] do
        resources :feedbacks, only: [:show, :new, :create]
        resources :forums, only: [:show, :create]
    end
    resources :sessions do
      resources :user_answers, only: [:create]
    end
    resources :feedbacks, only: [:edit, :update]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index ]
      resources :materials, only: [ :index ]
    end
  end



  get '/flashcards_notifications', to: 'teachers/teachers#trigger_score_notifications', as: 'flashcards_notifications'

end
