/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*form to add meet*/
function openForm() {
    makeUser(4, document.getElementById("user"));
    makePassw(6, document.getElementById("passw"), document.getElementById("passw2"));
    document.getElementById("modal").style.display = "block";
}

function closeForm() {
    document.getElementById("modal").style.display = "none";
}


//form para agendar cita para paciente no registrado
const prevBtns = document.querySelectorAll(".prev-btn");
const nextBtns = document.querySelectorAll(".next-btn");
const progress = document.getElementById("progress");
const formSteps = document.querySelectorAll(".form-step");
const progressSteps = document.querySelectorAll(".progress-step");
let formStepsNum = 0;
nextBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        formStepsNum++;
        updateFormSteps();
        updateProgress();
    });
});
prevBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        formStepsNum--;
        updateFormSteps();
        updateProgress();
    });
});
function updateFormSteps() {

    formSteps.forEach((formStep) => {
        formStep.classList.contains("form-step-active") &&
                formStep.classList.remove("form-step-active");
    });
    formSteps[formStepsNum].classList.add("form-step-active");
}

function updateProgress() {
    progressSteps.forEach((pStep, index) => {
        if (index < formStepsNum + 1) {
            pStep.classList.add("progress-step-active");
        } else {
            pStep.classList.remove("progress-step-active");
        }
    });
    const progressActive = document.querySelectorAll(".progress-step-active");
    progress.style.width = ((progressActive.length - 1) / (progressSteps.length - 1)) * 100 + "%";
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



//mostrar cita pendiente confirmada
function mostrarConfirmacionCita(documento, cita) {
    cita.style.display = "block";
    var xhttp = new XMLHttpRequest();
    var container = document.getElementById("cita");
    xhttp.onreadystatechange = function () {
        container.innerHTML = xhttp.responseText;

    };
    xhttp.open("GET", "vista/ajaxpages/confirmacioncita.jsp?doc=" + documento, false);
    xhttp.send();
}

function filtrarCitas(id) {
    var todos = document.getElementById("todo");
    var asig = document.getElementById("asig");
    var noasig = document.getElementById("unasig");
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    if (id === todos) {
        asig.classList.remove("active");
        noasig.classList.remove("active");
        todos.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarcitas.jsp?datos=todo", true);
    }
    if (id === asig) {
        todos.classList.remove("active");
        noasig.classList.remove("active");
        asig.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarcitas.jsp?datos=OK", true);
    }
    if (id === noasig) {
        noasig.classList.add("active");
        todos.classList.remove("active");
        asig.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarcitas.jsp?datos=unassigned", true);
    }
    xmlhttp.send();
}

function buscarPaciente(data) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/buscarcita.jsp?datos=" + data, true);
    xmlhttp.send();
}



//------------------agenda---------------------

document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {

        theme: true,
        headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: "timeGridDay,timeGridWeek,dayGridMonth,listWeek"
        },
        buttonText: {
            today: "Hoy",
            day: "Día",
            week: "Semana",
            month: "Mes",
            list: "Lista"
        },
        allDaySlot: false,
        titleFormat: {
            month: "short",
            year: "numeric",
            day: "numeric",
            weekDay: "short"
        },
        locale: "es",
        selectable: true,
        initialView: 'timeGridWeek',
        color: {color: "#fff", backgroudColor: "#269abc"},
        eventSources: ["vista/ajaxpages/calendar.jsp"],
        eventClick: function (info) {
            info.jsEvent.preventDefault();
//            if (event.url) {
//                window.location.href = event.url;
//                return false;
//            }
            openEvent(info.event.title, info.event.start, info.event.end);
//              alert("Nombre: "+info.event.title);
        }
    });
    calendar.render();
});

function openEvent(titulo, ini, fin) {
    document.getElementById("eventModal").style.display = "block";
    document.getElementById("nombre").innerHTML = "NOMBRE: " + titulo;
    document.getElementById("inicio").innerHTML = "INICIO: " + ini;
    document.getElementById("fin").innerHTML = "FIN: " + fin;
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
            {data: "nombre"},
            {
                data: "motivo",
                sortable: false
            },
            {
                data: "servicio",
                sortable: false
            },
            {
                data: "fecha_solicitud"
            },
            {
                data: "fecha_inicio",
                render: function (data) {
                    if (data == "") {
                        return "<span class='btn-warning' style='padding:2px 10px'>No asignado</span>";
                    } else {
                        return data;
                    }
                }
            },
            {
                data: "fecha_fin",
                sortable: false,
                render: function (data) {
                    if (data == "") {
                        return "<span class='btn-warning' style='padding:2px 10px'>No asignado</span>";
                    } else {
                        return data;
                    }
                }
            },
            {
                data: "medico",
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



