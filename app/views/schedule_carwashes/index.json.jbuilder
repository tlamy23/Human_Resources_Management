json.array!(@schedule_carwashes) do |schedule_carwash|
  json.extract! schedule_carwash, :date, :turn
  json.url schedule_carwash_url(schedule_carwash, format: :json)
end
