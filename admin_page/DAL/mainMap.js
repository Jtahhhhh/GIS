// xin cấp phép và show vị trí hiện tại
if (navigator.geolocation) {}
fetch('BLL/map.php')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    //cập nhật vị trí của admin để tạo bản đồ
    //console.log(data)
    navigator.geolocation.getCurrentPosition(function(position){
      var latitude = position.coords.latitude;
      var longitude = position.coords.longitude;
      mylocation = new L.marker( [latitude,longitude],{
        title: "my location"
      } );
      var popup = '<h5>My locate</h5>'
      mapOptions= {
        center: [latitude,longitude],
        zoom: 15
      };
      // Khai báo đối tượng bản đồ
      var map = new L.map('map', mapOptions);
      // Khai báo lớp bản đồ
      var layer = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
      // Thêm mới bản đồ
      map.addLayer(layer);
      //Tạo các marker của tất cả các xe
      for(let i=0;i<data.length; i++){
       
        var marker = L.marker([`${data[i].TX_viTriX}`, `${data[i].TX_viTriY}`])
        marker.bindPopup('Tài Xế:'+data[i].TX_USERNAME)
        marker.openPopup()
        marker.addTo(map) 
      }
    })
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



