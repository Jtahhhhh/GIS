fetch('BLL/txMap.php')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    //cập nhật vị trí của admin để tạo bản đồ
      console.log(data)
      // Khai báo đối tượng bản đồ
      var mapOptions = {
        center: [`${data[0].CX_TOADOBDX}`, `${data[0].CX_TOADOKTY}`],
        zoom: 10
      };
      var map = new L.map('map',mapOptions);
      // Khai báo lớp bản đồ
      var layer = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
      // Thêm mới bản đồ
      map.addLayer(layer);
      //Tạo các marker của tất cả các xe
      console.log([`${data[0].CX_TOADOBDX}`, `${data[0].CX_TOADOKTX}`],[`${data[0].CX_TOADOBDX}`, `${data[0].CX_TOADOKTY}`])
      L.Routing.control({
        waypoints: [[`${data[0].CX_TOADOBDX}`, `${data[0].CX_TOADOKTX}`],[`${data[0].CX_TOADOBDX}`, `${data[0].CX_TOADOKTY}`]],
        routeWhileDragging: true
        }).addTo(map);

    })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



