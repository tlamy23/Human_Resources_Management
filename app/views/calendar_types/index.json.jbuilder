json.array!(@calendar_types) do |calendar_type|
  json.extract! calendar_type, :name
  json.url calendar_type_url(calendar_type, format: :json)
end
