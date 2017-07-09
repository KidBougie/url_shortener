json.extract! url_short, :id, :original_url, :short_url, :created_at, :updated_at
json.url url_short_url(url_short, format: :json)
