(function(){App.controller("ReservaController",["$scope","Reserva",function(e,r){return e.reservas=r.query(),e.selectedReserva=null,e.update1=function(e){return e.confirmada=!0,r.update(e.id,e)}}])}).call(this);