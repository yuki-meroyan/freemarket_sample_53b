crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", user_path(current_user.id)
end

crumb :user do 
  link user.nickname, user_path
  parent :root
end

crumb :card do 
  link "支払い方法",card_path(current_user.id)
  parent :users
end

crumb :user_detail do 
  link "本人情報の確認",user_detail_path(current_user.id)
  parent :users
end

crumb :logout do 
  link "ログアウト", sign_out_confirm_path
  parent :users
end

crumb :user_profile do 
  link "プロフィール", user_path(current_user.id)
  parent :users
end

crumb :item do
  item = Item.find_by(id: params[:id])
  link item.name
  parent :root
end


crumb :users_items do 
  link "出品した商品 - 出品中",users_items_path
  parent :users
end

crumb :users_item do 
  link " 出品商品画面"
  parent :users_items
end