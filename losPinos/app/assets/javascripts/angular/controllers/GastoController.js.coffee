App.controller 'GastoController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
  $scope.gastos = []
  $http.get('./gastos.json').success((data) ->
    $scope.gastos = data
  )
]