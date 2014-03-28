json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :apellido, :fecha_nac, :nacionalidad, :documento, :documento_tipo, :comentarios, :email
  json.url cliente_url(cliente, format: :json)
end
