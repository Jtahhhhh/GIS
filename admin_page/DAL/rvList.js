fetch('BLL/review.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArrayTX = [];
    const htmlArrayCus = [];   
    const htmlArrayRV = [];      
    data.forEach(tx => {  
      console.log(tx)
      htmlArrayTX.push(`<tr>
                  <td>${tx.TX_TEN}</td>
                  <td>${tx.TX_SODIENTHOAI}</td>
                      </tr>`);
      htmlArrayCus.push(`<tr>
                    <td>${tx.KH_TEN}</td>
                    <td>${tx.KH_SODIENTHOAI}</td>
                    </tr>`);
      htmlArrayRV.push(`<tr>
                    <td>${tx.DG_SAO}</td>
                    </tr>`);       
                  
                  }
  
      );
    


    document.getElementById('TaiXe').innerHTML =  htmlArrayTX.join('')
    document.getElementById('KhachHang').innerHTML =  htmlArrayCus.join('')
    document.getElementById('Information').innerHTML =  htmlArrayRV.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



