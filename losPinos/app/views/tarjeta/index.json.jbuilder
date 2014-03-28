json.array!(@tarjeta) do |tarjetum|
  json.extract! tarjetum, :id, :nombre, :habilitada, :comentarios
  json.url tarjetum_url(tarjetum, format: :json)
end
