json.array!(@games) do |game|
  json.extract! game, :id, :name, :campaign_id
  json.url game_url(game, format: :json)
end
