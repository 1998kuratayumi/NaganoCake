Rails.application.routes.draw do

  root to: 'public/end_users#index'



# 管理者用
# /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admins/sessions"
}

namespace :admin do
   resources :end_users,only: [:index,:show,:edit,:update]
  	resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	# get 'search' => 'items#search'
  	root to: "homes#top"
  	resources :order_details,only: [:update]
  	resources :genres,only: [:index,:edit,:update,:show,:create]
  	resources :orders,only: [:index,:show,:update]
  end

  scope module: :public do
    get  "homes/top"  => "homes#top"
    get  "homes/about"  => "homes#about"
    resources :items,only: [:index,:show]
    resource :end_users,only: [:show,:edit,:update] do
  	  collection do #id不要
  	     get 'quit'
  	     patch 'out'
  	  end
  	end
  	patch "/ens_users/:id/quit" => "end_users#quit", as: 'users_quit' #menberを使っても良い
  	resources :cart_items,only: [:index,:update,:create,:destroy] do
    collection do
      delete '/all_destroy' => 'cart_items#all_destroy'
    end
   end
  	resources :orders,only: [:new,:index,:show,:create,:show] do
	   collection do
        post 'log'
        get 'thanks'
      end
    end
   resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  end
  
    # 顧客用
# /customers/sign_in ...
devise_for :end_users,skip: [:passwords,], controllers: {
  registrations: "end_users/registrations",
  sessions: 'end_users/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
