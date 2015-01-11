json.array!(@task_details) do |task_detail|
  json.extract! task_detail, :id, :details
  json.url task_detail_url(task_detail, format: :json)
end
