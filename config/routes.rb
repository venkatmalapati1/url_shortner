Rails.application.routes.draw do
  resources :url

  get '/:id', to: 'url#index'

end
