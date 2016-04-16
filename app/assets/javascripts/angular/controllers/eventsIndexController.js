angular.module("EventsApp").controller('EventsIndexController', function(Event, $scope){
  $scope.events = Event.query();
});
