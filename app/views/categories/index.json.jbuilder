json.array! @parents do |parent|
  json.id parent.id
  json.category parent.category
  json.ancestry parent.ancestry
end

json.array! @childs do |child|
  json.id child.id
  json.category child.category
  json.ancestry child.ancestry
end

json.array! @grandchilds do |grandchild|
  json.id grandchild.id
  json.category grandchild.category
  json.ancestry grandchild.ancestry
end