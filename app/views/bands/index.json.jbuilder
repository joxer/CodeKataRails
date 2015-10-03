json.array!(@bands) do |band|
  json.extract! band, :id, :name, :description, :image
  json.url band_url(band, format: :json)
end
