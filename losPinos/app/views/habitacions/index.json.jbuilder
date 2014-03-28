json.array!(@habitacions) do |habitacion|
  json.extract! habitacion, :id, :nombre, :descripcion, :disponible, :comentarios, :nro_camas_single, :nro_camas_matrimoniales
  json.url habitacion_url(habitacion, format: :json)
end
