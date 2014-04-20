App.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.reservas = []
  $http.get('./ultimas_reservas.json').success((data) ->
    $scope.reservas = data
  )
]

