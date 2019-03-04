json.extract! maintenance_report, :id, :motif, :description, :work_order_id, :status, :user_id, :created_at, :updated_at
json.url maintenance_report_url(maintenance_report, format: :json)
