fetch('BLL/main.php')
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
      console.log(tx.TX_MA)
      htmlArray.push(`<tr>
                  <td>
                  <td>${tx.TX_TEN}</td>
                  <td>${tx.TX_SODIENTHOAI}</td>
                  <td>
                  <form action="driverDetect.php" method="post">

                    <input type="hidden" name="cx_id" value='${tx.CX_MA}'>
                    <input type="hidden" name="TX_TEN" value='${tx.TX_TEN}'>
                    <input type="hidden" name="KH_TEN" value='${tx.KH_TEN}'>
                    <input type="hidden" name="KH_SDT" value='${tx.KH_SODIENTHOAI}'>
                    <input type="hidden" name="TX_SDT" value='${tx.TX_SODIENTHOAI}'>
                    <input type="hidden" name="BD" value='${tx.CX_TOADOBATDAU}'>
                    <input type="hidden" name="KT" value='${tx.CX_NOIDEN}'>
                    <input type="hidden" name="sao" value='${tx.DG_SAO}'>
                    <input type="hidden" name="bdx" value='${tx.CX_TOADOBDX}'>
                    <input type="hidden" name="bdy" value='${tx.CX_TOADOBDY}'>
                    <input type="hidden" name="ktx" value='${tx.CX_TOADOKTX}'>
                    <input type="hidden" name="kty" value='${tx.CX_TOADOKTY}'>
                    <input type="hidden" name="noidung" value='${tx.DG_NOIDUNG}'>

                    <button class="btn" onclick=""><i class="fas fa-edit"></i></button>
                  </form>
                      </tr>`);
    });
    
    document.getElementById('Information').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



