App.factory "Reserva", ["$resource", ($resource) ->
    return $resource("/reservas_display/:id", id: "@id",
      update:
        method: "PUT"
        params: 
        	id: "@id"
    )
]
