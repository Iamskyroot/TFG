/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//formulario de registro ACORDEON
var acc = document.getElementsByClassName("acordeon");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
//            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    });
}

//----------------------formulario de registro de paciente----------------------
//var tab = document.getElementsByClassName('form-step'),
//        step = document.getElementsByClassName('progress-step'),
//        progress = document.getElementById('progress'),
//        prevBtn = document.getElementById('prevBtn'),
//        nextBtn = document.getElementById('nextBtn');
//var currentTab = 0;
//showTab(currentTab);
//
//function showTab(n) {
//    tab[n].style.display = "block";
//    if (n == 0) {
//        prevBtn.style.display = "none";
//    } else {
//        prevBtn.style.display = "inline";
//    }
//
//    if (n == (tab.length - 1)) {
//        nextBtn.innerHTML = "Guardar";
//        
//    } else {
//        nextBtn.innerHTML = "Siguiente";
//    }
//
//    //mostrar el paso actual
//    fixStepIndicator(n);
//}
//
//function nextPrev(n) {
//    //no hacer nada si los campos requeridos no est'as completados
//    if (n === 1 && !validateForm())
//        return false;
//    //ocultar el formulario actual en caso contrario
//    tab[currentTab].style.display = "none";
//    currentTab = currentTab + n;
//    if (currentTab >= tab.length) {
//        //...enviar el formulario
//        nextBtn.type = "submit";
//        nextBtn.name = "accion";
//        nextBtn.style.background = "#04AA6D";
//        document.getElementById("regForm").submit();
//        return false;
//    }
//    //mostrar el formulario actual en caso contrario
//    showTab(currentTab);
//
//}
//
//function validateForm() {
//    // This function deals with validation of the form fields
//    var y, i, valid = true;
//    //recoge todos los campos obligatoios del form actual
//    y = tab[currentTab].getElementsByClassName("req");
//    // el bucle que checquea los campos requeridos
//    for (i = 0; i < y.length; i++) {
//        // If a field is empty...
//        if (y[i].value == "") {
//
//            y[i].style.background = "#ffdddd";
//            y[i].style.border = "1px solid red";
//            // and set the current valid status to false:
//            valid = false;
//        } else {
//            y[i].style.background = "#f1f1f1";
//            y[i].style.border = "none";
//        }
//    }
//    // If the valid status is true, mark the step as finished and valid:
//    if (valid) {
//        step[currentTab].className += " progress-step-active";
//    }
//    return valid; // return the valid status
//}
//function validateTriaje() {
//    // This function deals with validation of the form fields
//    var y, i, valid = true;
//    //recoge todos los campos obligatoios del form actual
//    y = document.getElementById('registroTriaje').getElementsByClassName("req");
//    // el bucle que checquea los campos requeridos
//    for (i = 0; i < y.length; i++) {
//        // If a field is empty...
//        if (y[i].value == "") {
//            // add an "invalid" class to the field:
//            y[i].style.background = "#ffdddd";
//            y[i].style.border = "1px solid red";
//            // and set the current valid status to false:
//            valid = false;
//        } else {
//            y[i].style.background = "#f1f1f1";
//            y[i].style.border = "none";
//        }
//    }
//
//    document.getElementById('prioridad').style.border = "none";
//    if (!validatePrioridad()) {
//        valid = false;
//        document.getElementById('prioridad').style.border = "1px solid red";
//    }
//
//
//    return valid; // return the valid status
//}
//
//function validatePrioridad() {
//    let dataCheck = false, k, validd = true;
//    i = document.getElementsByClassName('p');
//    for (k = 0; k < i.length; k++) {
//        if (i[k].checked) {
//            dataCheck = true;
//        }
//    }
//    if (!dataCheck) {
//        validd = false;
//    }
//    return validd;
//}
//
//function fixStepIndicator(n) {
//    // This function removes the "active" class of all steps...
//    var i;
//    for (i = 0; i < tab.length; i++) {
//        step[i].className = step[i].className.replace(" progress-step-active", "");
//    }
//    //... and adds the "active" class to the current step:
//    step[n].className += " progress-step-active";
//    updateProgress();
//}
//function updateProgress() {
//    var i;
//    for (i = 0; i < tab.length; i++) {
//        if (i < currentTab + 1) {
//            step[i].classList.add("progress-step-active");
//        } else {
//            step[i].classList.remove("progress-step-active");
//        }
//    }
//
//    const progressActive = document.getElementsByClassName("progress-step-active");
//    progress.style.width = ((progressActive.length - 1) / (step.length - 1)) * 100 + "%";
//}

function closeAlert() {
    var div = document.getElementById("alert_error");
    div.style.opacity = "0";
    setTimeout(function () {
        div.style.display = "none";
    }, 600);
}


/*filter*/
function filtrarLista() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("txtBuscar");
    filter = input.value.toUpperCase();
    ul = document.getElementById("listaTrata");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("label")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

//search data
function buscarPaciente(data) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/buscarpaciente.jsp?nombre=" + data, true);
    xmlhttp.send();
}

function getCurrentDate() {
    const date = new Date();
    let dd = date.getDate();
    let mm = date.getMonth() + 1;
    let yyyy = date.getFullYear();
    if (dd < 10) {
        dd = "0" + dd;
    }
    if (mm < 10) {
        mm = "0" + mm;
    }
    var fullDate = dd + "-" + mm + "-" + yyyy;

    return fullDate;
}


function filtrarPacientes(id) {
    var todos = document.getElementById("todo");
    var orden = document.getElementById("orden");
    var xmlhttp = new XMLHttpRequest();
//    var currentDate = new Date(date.getDay(),date.getMonth(),date.getFullYear());
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };

    if (id === todos) {
        orden.classList.remove("active");
        todos.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarpacientes.jsp?datos=" + todos, true);
    }
    if (id === orden) {
        todos.classList.remove("active");
        orden.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarpacientes.jsp?datos=" + orden, true);
    }
    xmlhttp.send();

}

//open the modal
function openForm(id) {
    id.style.display = "block";
    makeUser(4, document.getElementById('user'));
    makePassw(6, document.getElementById("passw"), document.getElementById("passw2"));
    document.getElementById("actualizarPaciente").style.display="none";
    document.getElementById("btnGuardar").style.display="block";
    document.getElementById("extraInput").style.display="none";
}

//abrir el modal de consulta
function openConsulta(modal, id, element) {
    cargarSintomas(id);
    element.value = id;
    modal.style.display = "block";
}
//obtener los sintomas de la ultima consulta
function cargarSintomas(id){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function(){
        document.getElementById('datosSinto').innerHTML = xhttp.responseText;
    }
    xhttp.open("GET", "vista/ajaxpages/getsintomas.jsp?paciente="+id,false);
    xhttp.send();
}


function editConsulta(idP, idC) {
    var paciente = idP;
    var consulta = idC;
    document.getElementById('editConsulta').style.display = "block";
    document.getElementById('idPaciente').value = paciente;
    document.getElementById('idConsulta').value = consulta;
    cargarTratamientos();
    cargarPruebas(consulta);
}

function cargarTratamientos() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById('listaTrata').innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/cargartratamientos.jsp", true);
    xmlhttp.send();
}

function cargarPruebas(idC) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById('listaEnfer').innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/cargarpruebas.jsp?idCo=" + idC, true);
    xmlhttp.send();
}


function openFormEdit(id, nom, edad, sexo, doc, dir, tel, usu, passw) {
    document.getElementById('registro').style.display = "block";
    document.getElementById('idPaci').value = id;
    document.getElementById('nombre').value = nom;
    document.getElementById('edad').value = edad;
    document.getElementById('sexo').selected = sexo;
    document.getElementById('doc').value = doc;
    document.getElementById('dir').value = dir;
    document.getElementById('tel').value = tel;
    document.getElementById('user').value = usu;
    document.getElementById('passw').value = passw;
    document.getElementById('passw2').value = passw;
//    document.getElementById('actualizarPaciente').disabled = false;
    document.getElementById('actualizarPaciente').style.display = "block";
    document.getElementById('btnGuardar').style.display = "none";
    document.getElementById('extraInput').style.display = "flex";
//    btnUpdate.setAttribute("disabled","enabled");


}

function closeForm(id) {
    id.style.display = "none";
}


//MAKE USER AUTOMATICALLY
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
    input.value=result;

}
function makePassw(length, input, input2) {
    let result = "";
    const charForPassw = "0123456789";
    const charUserLength = charForPassw.length;

    let counter = 0;
    while (counter < length) {
        result += charForPassw.charAt(Math.floor(Math.random() * charUserLength));
        counter++;
    }
    input.setAttribute("value", result);
    input2.setAttribute("value", result);
    input.value=result;
    input2.value=result;

}

//-----------------------------sintomas y sujerencias------------------------
var sintomas = document.getElementsByClassName("s");
var j;

for (j = 0; j < sintomas.length; j++) {
    sintomas[j].addEventListener("change", sugerencias);
}
function sugerencias() {

    var dataCheck = "", data = "";
    var fiebre = document.getElementById('f');
    var dc = document.getElementById('dc');
    var vomito = document.getElementById('v');
    var diarea = document.getElementById('diar');
    var debil = document.getElementById('deb');

    document.getElementById('sug').style.display = "block";

    /*FIEBRE CON OTRO/s SINTOMA 1-2*/

    if (fiebre.checked) {
//        dataCheck = "Fiebre";
        data = "fiebre";
        getSugerencias(data);
    }
    if (dc.checked) {
//        dataCheck = "Fiebre y dolor de cabeza";
        data = "dolor de cabeza";
        getSugerencias(data);
    }
    if (vomito.checked) {
//        dataCheck = "Fiebre y vomito";
        data = "vomito";
        getSugerencias(data);
    }
    if (diarea.checked) {
//        dataCheck = "Fiebre y diarea";
        data = "diarea";
        getSugerencias(data);
    }
    if (debil.checked) {
//        dataCheck = "Fiebre y debilidad";
        data = "debilidad";
        getSugerencias(data);
    }

}
function getSugerencias(data) {

    /*Enviar peticion al servidor*/
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        document.getElementById("sug").innerHTML = xhttp.responseText;
    };
    xhttp.open("GET", "vista/ajaxpages/sugerenciaspruebas.jsp?datos=" + data, false);
    xhttp.send();
}


$(document).ready(function () {

    var table = $("#tab").DataTable({
        paging: false,
        searching: false,
        info: false,
        language: {
            searchPlaceholder: "Buscar...",
            search: "_INPUT_",
            emptyTable: "No se ha encontrado ningun resultado",
            info: "Mostrando de _START_ a _END_",
            infoEmpty: "Ningun resultado",
            infoFiltered: "",
            zeroRecords: "No se ha encontrado ningun resultado"
        },
        dom: "Bfrtip",
        buttons: [
            {
                extend: "excelHtml5",
                text: "<i class='fas fa-file-excel'> Excel</i>",
                tittleAtrr: "Excel",
                className: "btn btn-success"
            },

            {
                extend: "pdfHtml5",
                text: "<i class='fas fa-file-pdf'> PDF</i>",
                tittleAtrr: "Pdf",
                className: "btn btn-info"
            },
            {
                extend: "print",
                text: "<i class='fas fa-print'> Imprimir</i>",
                tittleAtrr: "Print",
                className: "btn btn-primary"
            }

        ],

        columns: [
            {data: "id"},
            {
                data: "nombre",
            },
            {
                data: "edad",
                sortable: false
            },
            {
                data: "sexo",
                sortable: false
            },
            {
                data: "documento",
                sortable: false
            },
            {
                data: "direccion",
                sortable: false
            },
            {
                data: "telefono",
                sortable: false
            },
            {
                data: "acciones",
                sortable: false
            }
        ]
    });

    table.buttons().container().appendTo($("#export"));
});


