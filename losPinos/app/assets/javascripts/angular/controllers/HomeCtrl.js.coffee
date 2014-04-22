App.controller 'HomeCtrl', ['$scope', '$location', '$http', '$timeout',  ($scope, $location, $http, $timeout) ->
  $scope.reservas = []
  $http.get('./ultimas_reservas.json').success((data) ->
    $scope.reservas = data
  )

  $scope.dateNow = Date.now()

  $scope.difference = (reserva) -> 
    dias = Math.round((Date.parse(reserva.fecha_inicio_estadia) - Date.now()) / 86400000)
    horas = Math.round((Date.parse(reserva.fecha_inicio_estadia) - Date.now()) / 3600000)
    min = Math.round((Date.parse(reserva.fecha_inicio_estadia) - Date.now()) / 60000) 
    if min < 0
        tiempo = "hace "
        min = min * (-1)
        horas = horas * (-1)
        dias = dias * (-1)
    else
        tiempo = "en "
    if min > 59 && horas < 24
      return tiempo  + horas + " horas"
    else if horas > 23
      return tiempo  + dias + " dias"
    else
      return tiempo  + min + " minutos"    

  $scope.set_bg = (reserva) ->
    horas = Math.round((Date.parse(reserva.fecha_inicio_estadia) - Date.now()) / 3600000)
    min = Math.round((Date.parse(reserva.fecha_inicio_estadia) - Date.now()) / 60000)
    if min < 59 and horas < 1
      "background-color": "#C24641"
    else "background-color": "#FFF380"  if horas > 0 and horas < 6 

  $scope.set_color = (reserva) ->  
  	if Math.round((Date.parse(reserva.fecha_inicio_estadia) - Date.now()) / 60000) < 59
  		return 'color': 'white'
  
  fireDigestEveryMinute = ->
    $timeout (->
      fireDigestEveryMinute()
      return
    ), 60000
    return

  fireDigestEveryMinute()
]



