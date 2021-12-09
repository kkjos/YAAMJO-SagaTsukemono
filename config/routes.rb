Rails.application.routes.draw do
  devise_for :customer,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [] do
      collection do
      get :show
      get :edit
      get :unsubscribe
      patch :withdraw
    end
    end
    resources :cart_items, except: [:new, :show, :edit] do
      collection do
        delete :destroy_all
      end
    end
    resources :orders, except: [:edit, :update, :destroy] do
      collection do
        post :confirm
        get :confirm_view
        get :complete
      end
    end
      resources :addresses, except: [:show, :new]
    end

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
