App.factory 'Reserva', ['$resource', ($resource) ->
  $resource '/reservas/:id', id: '@id'
]
