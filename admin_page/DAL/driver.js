fetch('BLL/driver.php')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArray = data.map(tx => `
      <tr>
        <td>${tx.TX_ma}</td>
        <td>${tx.TX_ten}</td>
        <td>${tx.TX_sodienthoai}</td>
        <td>${tx.TX_email}</td>
        <td>${tx.DDG_SAO}/5</td>
        <td>
          <form action="changeorDeleteDriver.php" method="post">
            <input type="hidden" name="TX_MA" value='${tx.TX_ma}'>
            <input type="hidden" name="TX_Ten" value='${tx.TX_ten}'>
            <input type="hidden" name="TX_SDT" value='${tx.TX_sodienthoai}'>
            <input type="hidden" name="TX_email" value='${tx.TX_email}'>
            <input type="hidden" name="DDG_SAO" value='${tx.DDG_SAO}'>
            <input type="hidden" name="idtx" value='${tx.TX_ma}'>
            <button class="btn" type="submit"><i class="fas fa-edit"></i></button>
          </form>
        </td>
      </tr>
    `);
    document.getElementById('listTX').innerHTML = htmlArray.join('');
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });