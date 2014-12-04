json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :description, :game_master_id
  json.url campaign_url(campaign, format: :json)
end
