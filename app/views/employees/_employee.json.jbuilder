json.extract! employee, :id, :person_id, :position, :created_at, :updated_at
json.url employee_url(employee, format: :json)
