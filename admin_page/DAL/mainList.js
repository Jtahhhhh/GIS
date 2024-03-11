
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
      htmlArray.push(`<div class="">
                        <div class="body">
                            <h3 class="title">${tx.TX_ten}</h3>
                            <p class="author">${tx.TT_tinhTrang}</p>
                        </div>
                        <div class="option">
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                      </div>`);
    });

    document.getElementById('info').innerHTML =  htmlArray.join('')
      
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });



