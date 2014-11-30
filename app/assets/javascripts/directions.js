$(function(){
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var directionsService = new google.maps.DirectionsService();

  window.calcRoute = function(originCoords, destCoords) {
    var origin      = new google.maps.LatLng(originCoords[0], originCoords[1]);
    var destination = new google.maps.LatLng(destCoords[0], destCoords[1]);
    var request = {
        origin:      origin,
        destination: destination,
        travelMode:  google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });
  }

  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'directions'}}, function(){
    directionsDisplay.setMap(handler.getMap());
  });
});
