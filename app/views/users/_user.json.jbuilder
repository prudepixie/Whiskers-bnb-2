json.extract! user, :id, :first_name, :last_name, :email, :phone, :city, :address, :postal_code, :created_at, :updated_at
json.url user_url(user, format: :json)