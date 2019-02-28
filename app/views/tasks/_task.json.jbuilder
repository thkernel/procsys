json.extract! task, :id, :service_id, :contact, :motif_id, :time_limit, :processing_date, :status, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
