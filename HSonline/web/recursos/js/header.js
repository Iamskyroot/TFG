//            mostrar navevacion al clicquear el boton de menu
function menuResponsive() {
    var x = document.getElementById('navegacion');
    var open = document.getElementById('open');
    var close = document.getElementById('close');
    if (x.className === "navegacion") {
        x.className += " responsive";
        open.style.display = "none";
        close.style.display = "block";
    } else {
        x.className = "navegacion";
        open.style.display = "block";
        close.style.display = "none";
    }
}

function editarPerfil() {
    document.getElementById("btnGuardar").style.display = "block";
    document.getElementById("nom").removeAttribute("disabled");
    document.getElementById("edad").removeAttribute("disabled");
    document.getElementById("sexo").removeAttribute("disabled");
    document.getElementById("doc").removeAttribute("disabled");
    document.getElementById("dir").removeAttribute("disabled");
    document.getElementById("tel").removeAttribute("disabled");
    document.getElementById("user").removeAttribute("disabled");
    document.getElementById("passw").removeAttribute("disabled");
    document.getElementById("passw2").removeAttribute("disabled");
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


