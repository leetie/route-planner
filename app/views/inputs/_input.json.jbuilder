json.extract! input, :id, :title, :zipcode, :created_at, :updated_at
json.url input_url(input, format: :json)
