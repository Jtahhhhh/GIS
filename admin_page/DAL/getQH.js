fetch('BLL/getQH.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArray = [];
    console.log(data);
    data.forEach(qh => {  
      htmlArray.push(`<option value="'${qh.QH_ma}'">${qh.QH_ten}</option>`);
    });
    document.getElementById('QH').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



