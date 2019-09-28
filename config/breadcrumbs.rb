crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
end

crumb :user do |user|
  link user.nickname, user_path(user)
  parent :users
end
