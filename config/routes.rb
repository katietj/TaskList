Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks', to: 'tasks#index', as: 'tasks'

  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  get '/tasks/:id', to: 'tasks#show', as: 'task'


  patch '/tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  patch 'tasks/:id/undo_complete', to: 'tasks#undo_complete', as: 'undo_complete'
  patch '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy_task'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
