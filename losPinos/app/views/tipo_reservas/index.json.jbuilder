json.array!(@tipo_reservas) do |tipo_reserva|
  json.extract! tipo_reserva, :id, :nombre, :habilitada, :comentarios
  json.url tipo_reserva_url(tipo_reserva, format: :json)
end
