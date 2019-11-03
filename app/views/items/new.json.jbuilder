json.array! @child_categories.each do |child|
  json.id child.id
  json.name child.category
end
json.array! @grandchild_categories.each do |grandchild|
  json.id grandchild.id
  json.name grandchild.category
end