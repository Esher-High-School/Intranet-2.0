json.array!(@handbook_categories) do |handbook_category|
  json.extract! handbook_category, :id, :title
  json.url handbook_category_url(handbook_category, format: :json)
end
