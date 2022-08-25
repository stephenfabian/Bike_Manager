Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/shops', to: 'shops#index'
    get '/shops/:id', to: 'shops#show'
    get '/bikes', to: 'bikes#index'
    get '/bikes/:id', to: 'bikes#show'
    get '/shops/:id/bikes', to: 'shops#children_index'
end
