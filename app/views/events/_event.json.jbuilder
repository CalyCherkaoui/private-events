json.extract! event, :id, :title, :description, :event_date, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
