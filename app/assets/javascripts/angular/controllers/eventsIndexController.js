angular.module("EventsApp").controller('EventsIndexController', function(Event, $scope){
  $scope.events = Event.query();

  $scope.selectClass = function(option) {
    var classes = ["option-button", "btn", "btn-sm"];
    if (option.selected) {
      classes.push("btn-success");
    } else {
      classes.push("btn-default");
    }
    return classes.join(" ");
  };
});
