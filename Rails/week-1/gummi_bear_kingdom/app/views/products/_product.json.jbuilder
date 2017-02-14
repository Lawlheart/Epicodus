json.extract! product, :id, :name, :cost, :origin, :image, :created_at, :updated_at
json.url product_url(product, format: :json)