json.extract! task, :id, :task_name, :task_details, :is_finished, :deadline, :category_id, :created_at, :updated_at
json.url task_url(task, format: :json)
