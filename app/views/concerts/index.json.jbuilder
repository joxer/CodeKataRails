json.array!(@concerts) do |concert|
  json.extract! concert, :id, :position, :band_id, :location
end
