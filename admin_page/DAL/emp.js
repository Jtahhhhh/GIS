fetch('BLL/emp.php')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArray = [];
    console.log(data);
    data.forEach(ql => {
      htmlArray.push(`<tr>
                <td>${ql.QL_MA}</td>
                <td>${ql.QL_TEN}</td>
                <td>${ql.QL_SODIENTHOAI}</td>
                <td>${ql.QL_EMAIL}</td>
                <td>                   
                <form action="changeorDeleteEMP.php" method="post">           
                  <input type="hidden" name="id" value='${ql.QL_MA}'>
                  <input type="hidden" name="name" value='${ql.QL_TEN}'>
                  <input type="hidden" name="sdt" value='${ql.QL_SODIENTHOAI}'>
                  <input type="hidden" name="email" value='${ql.QL_EMAIL}'>
                  <input type="hidden" name="user" value='${ql.QL_USERNAME}'>
                  <input type="hidden" name="qh" value='${ql.QH_TEN}'>                           
                  <button class="btn" type="submit"><i class="fas fa-edit"></i></button> 
                </form>
                <form action="" method="http">
                  <input type="hidden" name="id" value='${ql.QL_MA}'>
                  <button class="btn" type="submit"><i class="fas fa-delete"></i></button>
                </form>
                </td> 
                </tr>`);
    });
    
    document.getElementById('listQL').innerHTML =  htmlArray.join('');
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });
