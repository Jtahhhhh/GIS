fetch('BLL/price.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log(data)
    const htmlArray = [];
    data.forEach(price => {

      htmlArray.push(`<tr>
                <td>${price.CTG_MA}</td>
                <td>${price.CTG_GIACANTREN}</td>
                <td>${price.CTG_GIACANDUOI}</td>
                <td>${price.CTG_DONGIA} </td>
                <td>VND/km</td>
                <td>
                <form action="" method="get">
                                <input type="hidden" name="xid" value='${price.CTG_MA}'>
                                <button class="btn btn-link" href=""><i class="fas fa-edit"></i></button>
                            </form> 
                </td>
                `);
    });

    document.getElementById('listPrice').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

 