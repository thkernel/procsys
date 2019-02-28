json.extract! order, :id, :ref, :arrival_date, :order_type_id, :customer_id, :status, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
