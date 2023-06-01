
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

//------------------------------------
//var sms = document.getElementById('cerrar_r');
//sms.addEventListener("click", function () {
//    var result = document.getElementById('result');
//    var message = document.getElementById('sms');
//    if (result.style.display === "block" && message.innerHTML === "") {
//        result.style.display = "none";
//    } else {
//        result.style.display = "block";
//    }
//});

//close alert
//var closealert = document.getElementsByClassName("closealert");
//var i;
//
//for (i = 0; i < closealert.length; i++) {
//    closealert[i].onclick = function () {
//        var div = this.parentElement;
//        div.style.opacity = "0";
//        setTimeout(function () {
//            div.style.display = "none";
//        }, 600);
//    };
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
function buscarConsulta(data) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/buscarconsulta.jsp?datos=" + data, true);
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

function filtrarConsultas(id) {
    var todos = document.getElementById("todo");
    var dia = document.getElementById("dia");
    var xmlhttp = new XMLHttpRequest();
//    var currentDate = new Date(date.getDay(),date.getMonth(),date.getFullYear());
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };

    if (id === todos) {
        dia.classList.remove("active");
        todos.classList.toggle("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarconsultas.jsp?datos=todo", true);
    }
    if (id === dia) {
        todos.classList.remove("active");
        dia.classList.toggle("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarconsultas.jsp?datos=" + getCurrentDate(), true);
    }
    xmlhttp.send();

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

//crear sugerencias
//var sintomas = document.getElementsByClassName("s");
////var opciones = ["fiebre","dolor de cabeza","vomitos","diarrea","debilidad"];
//var i;
//for (i = 0; i < sintomas.length; i++) {
//    sintomas[i].addEventListener("change", function(){
//        if (sintomas[i].checked===true) {
//            alert("Fiebre");
//        } else {
//            
//        }
//        
//    });
//}

//open the modal
function openForm(id) {
    id.style.display = "block";
    document.getElementById('actualizarPaciente').style.display = "none";
    document.getElementById('extraInput').style.display = "none";
    makeUser(4, document.getElementById('user'));
    makePassw(6, document.getElementById("passw"), document.getElementById("passw2"));
}
function openConsulta(id, nPaciente) {
    document.getElementById('idPaciente').value = id;
    document.getElementById('nom').value = nPaciente;
    document.getElementById('registroConsulta').style.display = "block";
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
    document.getElementById('extraInput').style.display = "flex";
//    btnUpdate.setAttribute("disabled","enabled");


}

function closeForm(id) {
    id.style.display = "none";
}


//SHOW PASSWORD
//function showPassword(id, input) {
//    //toggle type attribute
//    const type = input.getAttribute("type");
//
//    if (type === "password") {
//
//        input.setAttribute("type", "text");
//        //toggle the icon eye
//        id.classList.add("fa-eye");
//        id.classList.remove("fa-eye-slash");
//        id.style.color = "black";
//    } else {
//        input.setAttribute("type", "password");
//        id.classList.remove("fa-eye");
//        id.classList.add("fa-eye-slash");
//        id.style.color = "#666";
//    }
//}


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

}

//-----------------------------sintomas y sujerencias------------------------
var sintomas = document.getElementsByClassName("s");
var j;

for (j = 0; j < sintomas.length; j++) {
    sintomas[j].addEventListener("change", sugerencias);
//        if (sintomas[j].checked) {
//            alert("Hello world");
//        }
//    });
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
//    /*FIEBRE CON OTRO/s SINTOMA 1-3*/
//    if (fiebre.checked && dc.checked && vomito.checked) {
//        dataCheck = "Fiebre, dolor de cabeza y vomito";
//    }
//    if (fiebre.checked && diarea.checked && vomito.checked) {
//        dataCheck = "Fiebre, diarea y vomito";
//    }
//    if (fiebre.checked && diarea.checked && debil.checked) {
//        dataCheck = "Fiebre, diarea y debilidad";
//    }
//    if (fiebre.checked && dc.checked && debil.checked) {
//        dataCheck = "Fiebre, dolor de cabeza y debilidad";
//    }
//    if (fiebre.checked && vomito.checked && debil.checked) {
//        dataCheck = "Fiebre, vomito y debilidad";
//    }
//    if (fiebre.checked && diarea.checked && dc.checked) {
//        dataCheck = "Fiebre, diarea y dolor de cabeza";
//    }
//    /*FIEBRE CON OTRO/s SINTOMA 1-4*/
//
//    if (fiebre.checked && dc.checked && diarea.checked && vomito.checked) {
//        dataCheck = "Fiebre, dolor de cabeza, diarea y vomito";
//    }
//    if (fiebre.checked && debil.checked && diarea.checked && vomito.checked) {
//        dataCheck = "Fiebre, debilidad, diarea y vomito";
//    }
//    if (fiebre.checked && debil.checked && dc.checked && vomito.checked) {
//        dataCheck = "Fiebre, debilidad, dolor de cabeza y vomito";
//    }
//    if (fiebre.checked && dc.checked && diarea.checked && debil.checked) {
//        dataCheck = "Fiebre, dolor de cabeza, diarea y debilidad";
//    }
//
//    if (fiebre.checked && dc.checked && diarea.checked && vomito.checked && debil.checked) {
//        dataCheck = "Fiebre, dolor de cabeza, diarea, vomito y debilidad";
//    }


//    alert("Sintomas: " + dataCheck);
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

//------------------------------DATATABLE-------------
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
            infoEmpty: "Sin resultados",
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
            {data: "nombre"},
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
                searcheble: false,
                sortable: false
            }
        ]
    });

    table.buttons().container().appendTo($("#export"));
});

$(document).ready(function () {

    var table = $("#tab2").DataTable({
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
                data: "paciente",
                sortable: false
            },
            {
                data: "pruebas ordenadas",
                sortable: false
            },
            {
                data: "dianostico",
                sortable: false
            },
            {
                data: "fecha"
            },
            {
                data: "acciones",
                sortable: false
            }
        ]
    });

    table.buttons().container().appendTo($("#export"));
});








