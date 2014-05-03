App.factory "ReservaSinInclude", ["$resource", ($resource) ->
    return $resource("/reservas/:id", id: "@id"
    )
]