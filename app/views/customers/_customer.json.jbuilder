json.extract! customer, :id, :name, :status, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
