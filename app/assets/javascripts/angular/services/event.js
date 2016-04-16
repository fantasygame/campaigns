angular.module('EventsApp').factory('Event', function($resource){
  return $resource('/events/:id.json', {id: "@id"});
});
