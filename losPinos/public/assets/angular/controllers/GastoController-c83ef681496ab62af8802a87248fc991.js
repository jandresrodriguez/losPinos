(function(){App.controller("GastoController",["$scope","filterFilter","$http",function(t,o,s){return t.gastos=[],s.get("./gastos.json").success(function(o){return t.gastos=o})}])}).call(this);