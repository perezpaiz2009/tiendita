Rails.application.routes.draw do
    #delete '/products/:id', to: 'products#destroy' 
    #patch '/products/:id', to: 'products#update'
    #post '/products', to: 'products#create'
    #get '/products/new', to: 'products#new', as: :new_product
    #get '/products', to: 'products#index'
    #get '/products/:id', to: 'products#show', as: :product 
    #get '/products/:id/edit', to: 'products#edit',as: :edit_product
    resources :products, path: '/' #refactor de las rutas que las incluye todas, ademas se le añade path y la pleca, para
    #que al levantar el server cargue directo el index
end
