fetch('BLL/emp.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArray = [];
    console.log(data)
    data.forEach(ql => {
      htmlArray.push(`<tr>
                <td name="QL_MA">${ql.QL_MA}</td>
                <td>${ql.QL_TEN}</td>
                <td>${ql.QL_SODIENTHOAI}</td>
                <td>${ql.QL_EMAIL}</td>
                <td>
                <form action="post" method="get">
                                <input type="hidden" name="xid" value='${ql.QL_MA}'>
                                <button id="post" class="btn btn-link" > <i class="fas fa-edit"></i></button>
                            </form> 
                `);
    });
    


    document.getElementById('listQL').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });

 