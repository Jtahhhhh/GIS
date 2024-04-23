fetch('BLL/driverAndCar.php')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log(data)
    const htmlArray = data.map(tx => `
      <tr>
        <td>${tx.TX_TEN}</td>
        <td>${tx.X_TEN}</td>
        <td>
          <form action="changeorDeleteDriverAndCar.php" method="post">
            <input type="hidden" name="TX_Ma" value='${tx.TX_MA}'>
            <input type="hidden" name="TX_Ten" value='${tx.TX_TEN}'>
            <input type="hidden" name="X_Ten" value='${tx.X_TEN}'>
            <input type="hidden" name="X_Ma" value='${tx.X_MA}'>
            <button class="btn" type="submit"><i class="fas fa-edit"></i></button>
          </form>
        </td>
      </tr>
    `);
    document.getElementById('lisCarAndDriver').innerHTML = htmlArray.join('');
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });