fetch('BLL/trip.php')
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
                <td>${tx.CX_MA}</td>
                <td>${tx.TX_TEN}</td>
                <td>${tx.KH_TEN}</td>
                <td>${tx._CX_TOADOBATDAU}</td>
                <td>${tx.CX_NOIDEN}</td>
                <td>${tx.DG_SAO}/5</td>
                <td>
                  <form action="changeorDeleteEMP.php" method="get">
                    <input type="hidden" name="xid" value='${tx.QL_MA}'>
                    <button class="btn" onclick=""><i class="fas fa-edit"></i></button>
                  </form>
                </td>
              </tr>`);
    });
    document.getElementById('listTX').innerHTML =  htmlArray.join('');

  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

