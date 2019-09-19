Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items, only: [:index,:show]
  resources :users

  # TODO: ビューの確認用。ルーテイング。配置場所が決まり次第変更予定。
  get 'pending/itembuy' => 'pending#itembuy',as: 'pending/itembuy'
  get 'pending/edit' => 'pending#edit',as: 'pending/edit'
  get 'pending/logout' => 'pending#logout',as: 'pending/logout'
  get 'pending/index' => 'pending#index',as: 'pending/index'

end
