json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :start_date, :end_date, :location, :client_name
  json.url project_url(project, format: :json)
end
