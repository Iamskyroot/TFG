
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


function closeForm(id) {
    id.style.display = "none";
}



//------------------------------DATATABLE-------------

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
                sortable: false,
                render: function(data){
                    if(data==""){
                        return "<span class='btn-warning' style='padding:2px 10px'>No dianosticado</span>";
                    }else{
                        return "<span class='btn-success' style='padding:2px 10px'>Dianosticado</span>";
                    }
                }
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








