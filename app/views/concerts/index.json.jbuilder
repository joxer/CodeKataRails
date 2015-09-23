json.array!(@concerts) do |concert|
  json.extract! concert, :id, :position, :band_id, :location
  json.url concert_url(concert, format: :json)
end
