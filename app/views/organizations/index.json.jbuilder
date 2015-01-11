json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :products
  json.url organization_url(organization, format: :json)
end
