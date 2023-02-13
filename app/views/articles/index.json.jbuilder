# json.result "success"

json.data do
  json.array! @articles.each do |article|

    json.title article.title
    json.description article.description
  end
end