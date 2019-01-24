crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :exhibition do
  link "出品した商品-出品中", list_user_items_path(current_user)
  parent :mypage
end

crumb :profile do
  link "プロフィール", user_profile_path(current_user)
  parent :mypage
end

crumb :identification do
  link "本人確認", edit_user_path(current_user)
  parent :mypage
end

crumb :logout do
  link "ログアウト", user_logout_path(current_user)
  parent :mypage
end
