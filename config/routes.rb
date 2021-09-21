Rails.application.routes.draw do
  get 'bands/index'
  get 'bands/create'
  get 'bands/new'
  get 'bands/edit'
  get 'bands/show'
  get 'bands/update'
  get 'bands/destroy'
  get 'sessions/create'
  get 'users/show'
  get 'users/create'
  get 'users/new'

  resource :session, only: [:new, :destroy, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
