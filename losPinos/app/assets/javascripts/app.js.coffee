# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
window.App = angular.module('LosPinos', ['ngResource', 'Filters']).config [
	"$locationProvider" 
  	($locationProvider) ->
    $locationProvider.html5Mode true
]

