json.array!(@page_attachments) do |page_attachment|
  json.extract! page_attachment, :id, :title
  json.url page_attachment_url(page_attachment, format: :json)
end
