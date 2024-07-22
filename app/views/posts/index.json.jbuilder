json.array!(@posts) do |post|
  json.id post.id
  json.title post.title
  json.text post.text
  json.user post.user.name
end