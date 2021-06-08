json.extract! report, :id, :date, :details, :policeman_id, :complainant_id, :defendant_id, :category_id, :damage_id, :created_at, :updated_at
json.url report_url(report, format: :json)
