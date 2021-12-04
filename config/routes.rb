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
    resources :customers, except: [:new, :create, :index, :destroy]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    post '/customers/withdraw' => 'customers#withdraw'
    resources :cart_items, except: [:new, :show, :edit]
    get '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, except: [:edit, :update, :destroy]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/confirm_view' => 'orders#confirm_view'
    get '/orders/complete' => 'orders#complete'
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
