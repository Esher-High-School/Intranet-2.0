json.array!(@handbook_documents) do |handbook_document|
  json.extract! handbook_document, :id, :title, :category_id, :slug
  json.url handbook_document_url(handbook_document, format: :json)
end
