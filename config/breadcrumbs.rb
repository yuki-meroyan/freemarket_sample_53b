crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
end

crumb :user do |user|
  link user.nickname, user_path(user)
  parent :root
end

crumb :card do |card|
  link "支払い方法",card_path(cards_url)
  parent :users
end

crumb :user_detail do |user_detail|
  link "本人情報の確認",user_details_path(user_details_url)
  parent :users
end

crumb :logout do |logout|
  link "ログアウト", pending_logout_path(pending_logout_url)
  parent :users
end

crumb :user_profile do |logout|
  link "プロフィール", edit_user_path(edit_user_url)
  parent :users
end
