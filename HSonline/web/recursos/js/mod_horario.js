/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//search data
function buscar(data) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/buscarhorario.jsp?accion=buscar&datos=" + data, false);
    xmlhttp.send();
}

//delete
function eliminarHorario(id) {
    var xmlhttp = new XMLHttpRequest();
//    var confirm = confirm("Seguro que quiere eliminar a "+nom+"?");
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    if (confirm("Seguro que quiere eliminar el registro con ID " + id + "?") === true) {
        alert("Datos eliminados!");
        xmlhttp.open("GET", "vista/ajaxpages/buscarhorario.jsp?accion=eliminar&datos=" + id, true);
        xmlhttp.send();
    }

}

//horario
function editarHorario(id) {
    document.getElementById('modalHorario').style.display = "block";
    document.getElementById('idSan').value = id;
}

