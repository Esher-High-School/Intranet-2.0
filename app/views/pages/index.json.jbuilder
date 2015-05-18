json.array!(@pages) do |page|
  json.extract! page, :id, :title, :text
  json.url page_url(page, format: :json)
end
