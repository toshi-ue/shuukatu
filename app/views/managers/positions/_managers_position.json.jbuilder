json.extract! managers_position, :id, :title, :description, :address, :latitude, :longitude, :shopper_id, :created_at, :updated_at
json.url managers_position_url(managers_position, format: :json)
