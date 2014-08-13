json.array!(@stock_properties) do |stock_property|
  json.extract! stock_property, :id
  json.url stock_property_url(stock_property, format: :json)
end
