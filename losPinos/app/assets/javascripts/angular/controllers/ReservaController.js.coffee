App.controller 'ReservaController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
  $scope.reservas = []
  $http.get('./reservas_display.json').success((data) ->
    $scope.reservas = data
  )
]
