json.result 'success'
json.data do
  json.partial! 'posts/post', post: @post
end