Rails.application.routes.draw do
  devise_for :users
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
  get 'pending/member_complate' => 'pending#member_complate',as: 'pending/member_complate'
  get 'items/myitem/:id' => 'items#myitem',as: 'items/myitem'
  get 'pending/user_signup2/' => 'pending#user_signup2',as: 'pending/user_signup2'
  get 'pending/user_signup1/' => 'pending#user_signup1',as: 'pending/user_signup1'
  post '/items' => 'items#create'
end
