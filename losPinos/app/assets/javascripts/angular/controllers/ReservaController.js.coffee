#App.controller 'ReservaController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
#  $scope.reservas = []
#  $http.get('./reservas_display.json').success((data) ->
#    $scope.reservas = data
#  )
#]

App.controller 'ReservaController', ['$scope','Reserva', ($scope, Reserva) ->
  $scope.reservas = Reserva.query()
  $scope.selectedReserva = null

  $scope.update1 = (reserva) ->
    reserva.confirmada = true
    Reserva.update(reserva.id, reserva)
]


