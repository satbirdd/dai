Rails.application.routes.draw do
  get 'search', to: "search#index"

  root 'home#index'

  devise_for :users

  # resources :items

  namespace :admin do
    resources :shops do
	    resources :items do
	    	collection do
	    		get '/:product_id/new', to: 'items#new'
		    	get '/:category_id/products', to: 'items#products'
		    	get 'categories'
		    end
	    end
	  end
  end
end
