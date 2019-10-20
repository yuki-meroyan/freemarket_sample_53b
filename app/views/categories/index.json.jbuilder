json.array! @childs do |child|
  json.id child.id
  json.category child.category
  json.ancestry child.ancestry
end