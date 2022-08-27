Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/shops/new', to: 'shops#new'
    get '/shops', to: 'shops#index'
    get '/shops/:id', to: 'shops#show'
    get '/bikes', to: 'bikes#index'
    get '/bikes/:id', to: 'bikes#show'
    get '/shops/:id/bikes', to: 'shops#children_index'

    get '/shops/:id/edit', to: 'shops#edit'

    get '/shops/:id/bikes/new', to: 'shops#new_bike'
    post '/shops/:id/bikes', to: 'shops#create_bike'

    post '/shops', to: 'shops#create'
    patch '/shops/:id', to: 'shops#update'

    get '/bikes/:id/edit', to: 'bikes#edit'
    patch '/bikes/:id', to: 'bikes#update'

end
