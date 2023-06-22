$(document).ready(function () {
    $("#navBtn").click(function () {
        $(".main").toggleClass('animate');
    });
    //auto dismiss alert
    $(".alert").hide();
    $(".alert").fadeTo(3000,500).slideUp(500, function(){
        $(".alert").slideUp(500);
    });
});


function enableInputs() {
    alert("inputs disabled");
    document.getElementsByClassName("f_txt").setAttribute("readonly", "readonly");
}

function editarPerfil() {
    document.getElementById("btnGuardar").style.display = "block";
    document.getElementById("nom").removeAttribute("disabled");
    document.getElementById("nacion").removeAttribute("disabled");
    document.getElementById("doc").removeAttribute("disabled");
    document.getElementById("dir").removeAttribute("disabled");
    document.getElementById("tel").removeAttribute("disabled");
    document.getElementById("email").removeAttribute("disabled");
    document.getElementById("user").removeAttribute("disabled");
    document.getElementById("passw").removeAttribute("disabled");
    document.getElementById("passw2").removeAttribute("disabled");
}

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
function showPassword() {
    //toggle type attribute
    const type1 = document.getElementById('passw').getAttribute("type");
    const type2 = document.getElementById('passw2').getAttribute("type");

    if (type1 === "password") {

        document.getElementById('passw').setAttribute("type", "text");

    }
    if (type2 === "password") {

        document.getElementById('passw2').setAttribute("type", "text");

    } else {
        document.getElementById('passw').setAttribute("type", "password");
        document.getElementById('passw2').setAttribute("type", "password");

    }
}




