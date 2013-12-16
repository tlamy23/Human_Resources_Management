json.array!(@day_offs) do |day_off|
  json.extract! day_off, :name, :date
  json.url day_off_url(day_off, format: :json)
end
