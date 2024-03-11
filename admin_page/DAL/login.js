const btn = document.getElementById("btnLogin")
function checkLogin() {
    const inputMail = document.getElementById('InputEmail').value;
    const inputPass = document.getElementById('InputPassword').value;
    
    fetch('BLL/login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `inputMail=${encodeURIComponent(inputMail)}&inputPassword=${encodeURIComponent(inputPass)}`,
    })
    .then(response => response.json())
    .then(data => {
        if (data && 'CODE' in data) {
            const check = data.CODE;
            console.log(check)
            if (check == 0) {
                alert("Welcome back");
                
                window.location.href = "index.html";
                
                // Redirect or perform further actions after successful login
            } else if (check == 1) {
                alert("Wrong password");
            } else {
                alert("User does not exist");
            }
        } else {
            console.error('Invalid data format.');
        }
    })
    .catch(error => console.error('Error:', error));
}
btn.addEventListener('click',checkLogin)

