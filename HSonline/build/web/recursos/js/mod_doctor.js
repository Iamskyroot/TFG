/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//search data
function buscarPersonal(data) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/buscarpersonal.jsp?accion=buscar&datos=" + data, false);
    xmlhttp.send();
}

//delete
function eliminarPersonal(id, nom) {
    var xmlhttp = new XMLHttpRequest();
//    var confirm = confirm("Seguro que quiere eliminar a "+nom+"?");
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    if (confirm("Seguro que quiere eliminar a " + nom + "?") === true) {
        alert("Datos eliminados!");
        xmlhttp.open("GET", "vista/ajaxpages/buscarpersonal.jsp?accion=eliminar&datos=" + id, false);
        xmlhttp.send();
    }

}

//horario
function horarioPersonal(id){
    document.getElementById('modalHorario').style.display = "block";
    document.getElementById('idSan').value = id;
}

/*form to add doctor*/
function openForm() {
    document.getElementById("modal").style.display = "block";
    makePassw(6, document.getElementById('passw'), document.getElementById('passw2'));
    makeUser(6, document.getElementById('user'));
}

function closeForm(id) {
    id.style.display = "none";
}

function makePassw(length, input, input2) {
    let result = "";
    const charForPassw = "0123456789ABCDEFGHIJKLMNOPQRSTVWXYZ";
    const charUserLength = charForPassw.length;

    let counter = 0;
    while (counter < length) {
        result += charForPassw.charAt(Math.floor(Math.random() * charUserLength));
        counter++;
    }
    input.setAttribute("value", result);
    input2.setAttribute("value", result);

}
function makeUser(length, input) {
    let result = "";
    const charForUser = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const charUserLength = charForUser.length;

    let counter = 0;
    while (counter < length) {
        result += charForUser.charAt(Math.floor(Math.random() * charUserLength));
        counter++;
    }
    input.setAttribute("value", result);

}


