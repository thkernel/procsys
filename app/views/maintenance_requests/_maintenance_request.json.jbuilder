json.extract! maintenance_request, :id, :motif, :station_id, :status, :user_id, :created_at, :updated_at
json.url maintenance_request_url(maintenance_request, format: :json)
