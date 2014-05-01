App.controller 'ClienteController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
  $scope.clientes = []
  $http.get('./clientes.json').success((data) ->
    $scope.clientes = data
  )
]
