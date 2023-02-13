json.result 'success'
json.data do
  json.array! @articles.each do |article|
    json.id article.id
    json.title article.title
    json.description article.description
  end
end
