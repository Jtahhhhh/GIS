fetch('BLL/getXE.php')
.then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    const htmlArray = [];
    console.log(data);
    data.forEach(xe => {  
      htmlArray.push(`<option value="'${xe.X_MA}'" name='X_MA'>${xe.X_TEN} (${xe.X_BIENSO})</option>`);
    });
    
    document.getElementById('xe').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });


