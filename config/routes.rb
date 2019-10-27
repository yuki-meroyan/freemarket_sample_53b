Rails.application.routes.draw do
 
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  devise_scope :user do
    get "sign_up", to: "users/registrations#new"
    get "sign_up_phone_number", to: "users/registrations#new_phone_number"
    get "sign_up_card_add", to: "users/registrations#new_card_add"
    get "sign_up_complet", to: "users/registrations#new_complet"
    get "sign_out_confirm", to: "users/sessions#destroy_confirm"
    get "sign_up-select", to: "users/registrations#new-select"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"

  resources :user_details, only:[:show, :edit, :update,:new,:create]
  resources :items, only: [:index, :show, :destroy, :new] do
    collection do
      get 'items/search/' =>'items#search',as: 'items/search'
    end
    resources :transaction_informations, only: [:index, :create]
 end

  resources :users
  resources :users_items, only: [:index, :show]
  resources :cards, except: [:edit, :update]
  # TODO: ビューの確認用。ルーテイング。配置場所が決まり次第変更予定。

  get 'pending/itembuy' => 'pending#itembuy',as: 'pending/itembuy'
  get 'pending/index' => 'pending#index',as: 'pending/index'
  get 'items/myitem/:id' => 'items#myitem',as: 'items/myitem'
  get 'pending/user_signup1/' => 'pending#user_signup1',as: 'pending/user_signup1'
  post '/items' => 'items#create'

  get 'pending/user_signup2/' => 'pending#user_signup2',as: 'pending/user_signup2'
  get 'pending/user_signup3/' => 'pending#user_signup3',as: 'pending/user_signup3'
  get 'pending/user_signup4/' => 'pending#user_signup4',as: 'pending/user_signup4'
  get 'pending/user_signup5/' => 'pending#user_signup5',as: 'pending/user_signup5'
  get 'pending/item_edit/' => 'pending#item_edit',as: 'pending/item_edit'
end
