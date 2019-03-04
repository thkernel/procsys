json.extract! work_order, :id, :motif, :maintenance_request_id, :status, :user_id, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
