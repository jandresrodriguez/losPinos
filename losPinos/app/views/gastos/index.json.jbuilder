json.array!(@gastos) do |gasto|
  json.extract! gasto, :id, :fecha, :rubro, :monto, :moneda, :comentarios
  json.url gasto_url(gasto, format: :json)
end
