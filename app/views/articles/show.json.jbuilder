json.result 'success'

json.data do
  json.partial! 'article', article: @article
end
