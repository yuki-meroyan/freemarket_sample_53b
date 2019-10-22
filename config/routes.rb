Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"

  resources :items, only: [:index, :show, :destroy, :new]
  resources :users
  resources :user_details, only:[:show, :edit, :update]
  resources :cards, only: [:index, :new, :show, :create, :destroy]
  resources :user_details
  resources :items do
    resources :transaction_informations, only: [:index, :create]
  end
  
  resources :users
  resources :cards, except: [:edit, :update]
  # TODO: ビューの確認用。ルーテイング。配置場所が決まり次第変更予定。
  get 'pending/itembuy' => 'pending#itembuy',as: 'pending/itembuy'
  get 'pending/logout' => 'pending#logout',as: 'pending/logout'
  get 'pending/index' => 'pending#index',as: 'pending/index'
  get 'items/myitem/:id' => 'items#myitem',as: 'items/myitem'
  get 'pending/user_signup1/' => 'pending#user_signup1',as: 'pending/user_signup1'
  get 'pending/user_signup2/' => 'pending#user_signup2',as: 'pending/user_signup2'
  get 'pending/user_signup3/' => 'pending#user_signup3',as: 'pending/user_signup3'
  get 'pending/user_signup4/' => 'pending#user_signup4',as: 'pending/user_signup4'
  get 'pending/user_signup5/' => 'pending#user_signup5',as: 'pending/user_signup5'
  get 'pending/item_edit/' => 'pending#item_edit',as: 'pending/item_edit'
end
