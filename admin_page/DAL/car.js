fetch('BLL/car.php')
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
      if(tx.TX_MA == null){
      htmlArray.push(`<tr>
                <td>${tx.X_MA}</td>
                <td>${tx.X_TEN}</td>
                <td>${tx.X_BIENSO}</td>
                <td>Chưa nhận bàn giao</td>
                <td>${tx.X_THONGSO}</td>
                <td>
                <form action="changeorDeleteCar.php" method="post">
                <input type="hidden" name="X_MA" value='${tx.X_ma}'>
                <input type="hidden" name="X_Ten" value='${tx.X_ten}'>
                <input type="hidden" name="X_Bien" value='${tx.X_BIENSO}'>
                <input type="hidden" name="X_ThongSo" value='${tx.X_THONGSO}'>
                <button class="btn" type="submit"><i class="fas fa-edit"></i></button>
              </form>
                </td>
              </tr>`);}
         else{
          htmlArray.push(`<tr>
                <td>${tx.X_MA}</td>
                <td>${tx.X_TEN}</td>
                <td>${tx.X_BIENSO}</td>
                <td>${tx.TX_MA}</td>
                <td>${tx.X_THONGSO}</td>
                <td>
                <form action="changeorDeleteCar.php" method="post">
                <input type="hidden" name="X_MA" value='${tx.X_ma}'>
                <input type="hidden" name="X_Ten" value='${tx.X_ten}'>
                <input type="hidden" name="X_Bien" value='${tx.X_BIENSO}'>
                <input type="hidden" name="X_ThongSo" value='${tx.X_THONGSO}'>
                <input type="hidden" name="TX_MA" value='${tx.TX_MA}'>
                <button class="btn" type="submit"><i class="fas fa-edit"></i></button>
              </form>
                </td>
              </tr>`);}
    })
    
    document.getElementById('listTX').innerHTML =  htmlArray.join('');

  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

  function redirectToChangeOrDeleteEMP(taxi){
    const jsonData = JSON.stringify(taxi);
    console.log(jsonData);
}
