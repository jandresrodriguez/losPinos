App.controller 'ControlHabitacionesController', ['$scope','filterFilter', '$http',  ($scope, $filterFilter,  $http) ->
	$scope.cantidad = 0
	$scope.dias_habitaciones = []
	$http.get('./habitaciones_estado?cantidad=' + $scope.cantidad).success((data) ->
		$scope.dias_habitaciones = data
	)

	#Monitoreo la posicion del cursor
	$(document).mousemove (event) ->
		$('#calendario_informacion').css({ top: event.pageY + 2, left: event.pageX + 2})
		return

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
			"ocupado"

	$scope.obtener_datos = () ->
		$http.get('./habitaciones_estado?cantidad=' + $scope.cantidad).success((data) ->
			$scope.dias_habitaciones = data
		)

	$scope.mostrar_informacion = (item, posicion) ->
		# Si la posicion esta ocupada, muestro el panel de informacion
		if ! item.dias_estado[posicion].libre
			$('#calendario_informacion').finish()
			$('#calendario_informacion').fadeIn()
			$scope.reserva = item.dias_estado[posicion].reserva
			console.log($scope.reserva)

	$scope.ocultar_informacion = () ->
		$('#calendario_informacion').finish()
		$('#calendario_informacion').fadeOut()
]