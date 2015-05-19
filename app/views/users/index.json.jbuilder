json.array!(@users) do |user|
  json.extract! user, :id, :name, :admin, :publisher, :slug
  json.url user_url(user, format: :json)
end
