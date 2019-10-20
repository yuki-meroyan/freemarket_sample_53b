json.array! @grandchild_categories.each do |grandchild|
  json.id grandchild.id
  json.name grandchild.category
end