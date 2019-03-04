json.extract! delivery_slip, :id, :ref, :order_id, :customer_id, :user_id, :status, :created_at, :updated_at
json.url delivery_slip_url(delivery_slip, format: :json)
