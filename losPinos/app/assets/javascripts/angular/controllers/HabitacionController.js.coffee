App.controller 'HabitacionController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
  $scope.habitaciones = []
  $http.get('./habitacions.json').success((data) ->
    $scope.habitaciones = data
  )
]