fetch('BLL/main.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    //console.log(data)
    const htmlArray = [];
    data.forEach(tx => {  
      htmlArray.push(`<tr>
                  <td>${tx.TX_ten}</td>
                  <td>${tx.TX_sodienthoai}</td>
                      </tr>`);
    });
    
    document.getElementById('Information').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



