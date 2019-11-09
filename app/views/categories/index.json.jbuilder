json.array! @categories do |category|
  json.id category.id
  json.category category.category
  json.ancestry category.ancestry
end