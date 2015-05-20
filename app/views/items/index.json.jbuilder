json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :sold, :campaign_id, :hero_id
  json.url item_url(item, format: :json)
end
