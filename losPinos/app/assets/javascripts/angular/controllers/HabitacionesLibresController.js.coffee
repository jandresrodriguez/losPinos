App.controller 'ControlHabitacionesController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
	$scope.cantidad = 0
	$scope.dias_habitaciones = []
	$http.get('./habitaciones_estado?cantidad=' + $scope.cantidad).success((data) ->
		$scope.dias_habitaciones = data
	)

	$scope.avanzar_semana = () ->
		$scope.cantidad = $scope.cantidad + 1
		$http.get('./habitaciones_estado?cantidad=' + $scope.cantidad).success((data) ->
			$scope.dias_habitaciones = data
		)

	$scope.retroceder_semana = () ->
		$scope.cantidad = $scope.cantidad - 1
		$http.get('./habitaciones_estado?cantidad=' + $scope.cantidad).success((data) ->
			$scope.dias_habitaciones = data
		)

	$scope.set_class = (libre) ->
		if libre
			"libre"
		else
			"ocupada"

	$scope.obtener_datos = () ->
		$http.get('./habitaciones_estado?cantidad=' + $scope.cantidad).success((data) ->
			$scope.dias_habitaciones = data
		)
]