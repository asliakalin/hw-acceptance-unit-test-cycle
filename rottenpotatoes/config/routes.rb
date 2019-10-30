Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/movies/:id', to: 'movies#show'
  get 'movies/:id/list_similar', to: 'movies#list_similar', as: 'similar_movies'
end
