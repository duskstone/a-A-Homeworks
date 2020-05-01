Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :destroy, :new]

  #session is singular along with resource

  #why do we use only
    #If we use default version without only, we automatically create RESTful routes
end
