angular.module("EventsApp").controller('EventsIndexController', function(Event, $scope, $http){
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

  $scope.toggle = function(event, option) {
    $http({
      url: "/events/" + event.id + "/toggle_option",
      method: "GET",
      params: { day: option.day, hour: option.hour }
    }).then(function() {
      option.selected = !option.selected;
    },
    function() {
      alert('Something went wrong')
    });
  };
});
