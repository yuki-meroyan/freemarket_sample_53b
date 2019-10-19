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
  link "本人情報の確認",user_detail_path
  parent :users
end

crumb :logout do 
  link "ログアウト", pending_logout_path
  parent :users
end

crumb :user_profile do 
  link "プロフィール", user_path(current_user.id)
  parent :users
end

crumb :item do |item|
  item = Item.find_by(id: params[:id])
  link item.name
  parent :root
end