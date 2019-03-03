json.extract! order_status, :id, :name, :description, :user_id, :status, :created_at, :updated_at
json.url order_status_url(order_status, format: :json)
