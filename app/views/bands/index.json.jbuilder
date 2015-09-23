json.array!(@bands) do |band|
  json.extract! band, :id, :name, :description
  json.url band_url(band, format: :json)
end
