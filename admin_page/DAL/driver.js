fetch('BLL/driver.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log(data)
    const htmlArray = [];
    data.forEach(tx => {
    
      htmlArray.push(`<tr>
                <td>${tx.TX_ma}</td>
                <td>${tx.TX_ten}</td>
                <td>${tx.TX_sodienthoai}</td>
                <td>${tx.TX_email}</td>
                <td>${tx.X_ten}</td>
                <td>${tx.DDG_SAO}/5</td>
                <td>
                <form action="" method="get">
                                <input type="hidden" name="xid" value='${tx.QL_MA}'>
                                <button class="btn btn-link" href=""><i class="fas fa-edit"></i></button>
                            </form> 
                </td>
                `);
    });

    document.getElementById('listTX').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

 