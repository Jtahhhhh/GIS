fetch('BLL/emp.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log(data)
    const htmlArray = [];
    data.forEach(ql => {
      console.log(ql.QL_ten)
      htmlArray.push(`<tr>
                <td>${ql.QL_MA}</td>
                <td>${ql.QL_TEN}</td>
                <td>${ql.QL_SODIENTHOAI}</td>
                <td>${ql.QL_EMAIL}</td>
                <td>
                <form action="" method="get">
                                <input type="hidden" name="xid" value='${ql.QL_MA}'>
                                <button class="btn btn-link" href=""><i class="fas fa-edit"></i></button>
                            </form> 
                `);
    });

    document.getElementById('listQL').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

 