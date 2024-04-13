const key = 'LS0KWnP1074lYjp8U5EM';

const map = L.map('map').setView([10.024827037399543,105.75911501823524], 70);
const layer = L.tileLayer(`https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}.png?key=${key}`,{
  tileSize: 512,
  zoomOffset: -1,
  minZoom: 1,
  attribution: "\u003ca href=\"https://www.maptiler.com/copyright/\" target=\"_blank\"\u003e\u0026copy; MapTiler\u003c/a\u003e \u003ca href=\"https://www.openstreetmap.org/copyright\" target=\"_blank\"\u003e\u0026copy; OpenStreetMap contributors\u003c/a\u003e",
  crossOrigin: true
}).addTo(map);

if(!navigator.geolocation) {
      console.log("Your browser doesn't support geolocation feature!")
  } else {
      
          navigator.geolocation.getCurrentPosition(getPosition)
      
  }
  
  var taxiIcon = L.icon({
          iconUrl: 'img/taxi.png',
          iconSize: [70, 70]
      })
      

  var marker, circle;

  function getPosition(position){
      // console.log(position)
      var lat = position.coords.latitude
      var long = position.coords.longitude
      var accuracy = position.coords.accuracy

      if(marker) {
          map.removeLayer(marker)
      }

      if(circle) {
          map.removeLayer(circle)
      }

   //   marker = L.marker([lat, long])
      circle = L.circle([lat, long], {radius: accuracy})
      marker = L.marker([lat, long], { icon: taxiIcon }).addTo(map)

      var featureGroup = L.featureGroup([marker, circle]).addTo(map)

      map.fitBounds(featureGroup.getBounds())

      console.log("Your coordinate is: Lat: "+ lat +" Long: "+ long + " Accuracy: "+ accuracy)
      
        // Gia lap di chuyen
      map.on('click', function (e) {        
          var newMarker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(map);
          L.Routing.control({
              waypoints: [
                  L.latLng(lat, long),
                  L.latLng(e.latlng.lat, e.latlng.lng)
              ]
          }).on('routesfound', function (e) {
              var routes = e.routes;
              console.log(routes);

              e.routes[0].coordinates.forEach(function (coord, index) {
                  setTimeout(function () {
                      marker.setLatLng([coord.lat, coord.lng]);
                  }, 20 * index)
              })

          }).addTo(map);
      });
  }
  
  
L.control.maptilerGeocoding({ apiKey: key }).addTo(map);