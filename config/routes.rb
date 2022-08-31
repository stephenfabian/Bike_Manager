Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/shops', to: 'shops#index'
    get '/shops/new', to: 'shops#new'
    post '/shops', to: 'shops#create'
    delete '/shops', to: 'shops#destroy'
    get '/shops/:id', to: 'shops#show'
    get '/shops/:id/edit', to: 'shops#edit'
    patch '/shops/:id', to: 'shops#update'
    delete '/shops/:id', to: 'shops#destroy'

    get '/shops/:id/bikes', to: 'shop_bikes#index'
    get '/shops/:id/bikes/new', to: 'shop_bikes#new'
    post '/shops/:id/bikes', to: 'shops#create_bike'
    get '/shops/:id/bikes', to: 'shops#records_over_threshold'

    get '/bikes', to: 'bikes#index'
    get '/bikes/:id', to: 'bikes#show'
    get '/bikes/:id/edit', to: 'bikes#edit'
    patch '/bikes/:id', to: 'bikes#update'
    delete '/bikes/:id', to: 'bikes#destroy'
end
