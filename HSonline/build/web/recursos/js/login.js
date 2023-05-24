//open form
function openForm(){
    document.getElementById("registro").style.display = "block";
}
//close form
function closeForm() {
    document.getElementById("registro").style.display = "none";
}
//comprobar las contrasenas
function checkPassword() {
    var passw1 = document.getElementById("passw");
    var passw2 = document.getElementById("passw2");

    if (passw1.value !== passw2.value) {
        alert("Las contraseñas no coinciden, vuelva a intentarlo");
        return false;
    } else {
        return true;
    }
}

//SHOW PASSWORD
function showPassword(id, input) {
    //toggle type attribute
    const type = input.getAttribute("type");

    if (type === "password") {

        input.setAttribute("type", "text");
        //toggle the icon eye
        id.classList.add("fa-eye");
        id.classList.remove("fa-eye-slash");
        id.style.color = "black";
    } else {
        input.setAttribute("type", "password");
        id.classList.remove("fa-eye");
        id.classList.add("fa-eye-slash");
        id.style.color = "#666";
    }
}

