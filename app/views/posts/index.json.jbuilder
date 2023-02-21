json.result 'success'

json.data do
  json.array! @posts.each do |post|
    json.partial! 'posts/post', post:
  end
end
