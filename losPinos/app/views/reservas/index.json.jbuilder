json.array!(@reservas) do |reserva|
  json.extract! reserva, :id, :fehca_creacion, :fecha_inicio_estadia, :fecha_fin_estadia, :monto, :moneda, :abonada, :forma_de_pago, :tipo_reserva_id, :cliente_id, :habitacion_id, :comentarios
  json.url reserva_url(reserva, format: :json)
end
