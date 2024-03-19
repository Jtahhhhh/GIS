fetch('BLL/customer.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArray = [];
    console.log(data)
    data.forEach(KH => {
      htmlArray.push(`<tr>
                <td name="KH_MA">${KH.KH_MA}</td>
                <td>${KH.KH_TEN}</td>
                <td>${KH.KH_SODIENTHOAI}</td>
                <td>${KH.KH_EMAIL}</td>
                <td>${KH.KH_DIEMTICHLUY}
                `);
    });
    


    document.getElementById('listKH').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

 