Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  devise_scope :user do
    post "users/sign_up", to: "users/registrations#create"
    get "sign_in", to: "users/registrations#new"
    get "sign_in2", to: "users/registrations#new2"
    get "sign_in4", to: "users/registrations#new4"
    get "sign_up5", to: "users/registrations#new5"
    get "sign_out1", to: "users/sessions#destroy1"
    get "sign_up6", to: "users/registrations#new6"
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :user_details
  resources :items, only: [:index, :show, :destroy, :new]

  resources :users
  resources :cards, only: [:index, :new, :show, :create, :destroy]


  
  # TODO: ビューの確認用。ルーテイング。配置場所が決まり次第変更予定。

  get 'pending/itembuy' => 'pending#itembuy',as: 'pending/itembuy'
  get 'pending/edit' => 'pending#edit',as: 'pending/edit'
  get 'pending/logout' => 'pending#logout',as: 'pending/logout'
  get 'pending/index' => 'pending#index',as: 'pending/index'
  get 'items/myitem/:id' => 'items#myitem',as: 'items/myitem'

end
