json.extract! flight, :id, :time, :duration, :to_airport_id, :from_airport_id, :created_at, :updated_at
json.url flight_url(flight, format: :json)
