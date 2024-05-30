json.extract! applicant, :id, :name, :email, :phone, :user_id, :position_id, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
