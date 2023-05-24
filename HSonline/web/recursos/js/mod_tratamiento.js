

/*form to add doctor*/
//open modal
function openForm() {
    document.getElementById("modal").style.display = "block";
}
//close modal
function closeForm() {
    document.getElementById("modal").style.display = "none";
}

//acordeon tratamientos
var acc = document.getElementsByClassName("acordeon");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        /* Toggle between adding and removing the "active" class,
         to highlight the button that controls the panel */
        this.classList.toggle("active_trat");

        /* Toggle between hiding and showing the active panel */
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}

//create new inputs
function crearCampos() {
    const container = document.getElementById("receta");
    const row = document.createElement("div");
    const column = [document.createElement("div"), document.createElement("div"), document.createElement("div"),document.createElement("div")];
    const input = [document.createElement("input"), document.createElement("input"), document.createElement("input"),document.createElement("input")];
    const deletebtn = document.createElement("button");
    var icon = document.createElement("i");
    icon.className = "fas fa-trash-alt";
    deletebtn.type = "button";
    deletebtn.className = "row_btn";
    deletebtn.appendChild(icon);


    input[0].placeholder = "Nombre del medicamento";
//    input[0].name = "medicamento";
    input[0].setAttribute("name", "medicamento");
    input[1].placeholder = "Cantidad";
//    input[0].name = "medicamento";
    input[1].setAttribute("name", "cantidad");
    input[2].placeholder = "Dosis";
//    input[1].name = "dosis";
    input[2].setAttribute("name", "dosis");
    input[3].placeholder = "00-00-00";
//    input[2].name = "frecuencia";
    input[3].setAttribute("name", "frecuencia");
    row.className = "f_row";

    for (var i = 0; i < column.length; i++) {
        column[i].className = "f_column";
        input[i].className = "f_txt";
        row.appendChild(column[i]);
        column[i].appendChild(input[i]);
    }
    row.appendChild(deletebtn);

    container.appendChild(row);

    deletebtn.addEventListener("click", function () {
        container.removeChild(row);
    });

}

//function crearTratamiento(respuesta){
//    $('btnguardar').click(function(e){
//        e.preventDefault();
//    })
//}

//insertar datos a la base de datos
function buscarTratamiento(txt){
    const xhttp = new XMLHttpRequest();
    var container = document.getElementById('res');
    xhttp.onreadystatechange = function(){
        container.innerHTML = xhttp.responseText;
    };
    
    xhttp.open("GET","vista/ajaxpages/buscartratamiento.jsp?accion=buscar&datos="+txt, true);
//    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();
    
    
}

//delete
function eliminarPrescripcion(id, press) {
    var xmlhttp = new XMLHttpRequest();
//    var confirm = confirm("Seguro que quiere eliminar a "+nom+"?");
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    if (confirm("Seguro que quiere eliminar \'" + press + "\' con ID "+id+"?") === true) {
        xmlhttp.open("GET", "vista/ajaxpages/buscartratamiento.jsp?accion=eliminar&datos=" + id, false);
        xmlhttp.send();
        alert("Datos eliminados!");
    }

}

function filtrarTratamiento(id){
    var todos = document.getElementById("todo");
    var orden = document.getElementById("orden");
    var adultos = document.getElementById("adult");
    var ninos = document.getElementById("nn");
    var bebes = document.getElementById("bb");
    var xmlhttp = new XMLHttpRequest();
//    var currentDate = new Date(date.getDay(),date.getMonth(),date.getFullYear());
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    
    if (id===todos) {
        orden.classList.remove("active");
        adultos.classList.remove("active");
        ninos.classList.remove("active");
        bebes.classList.remove("active");
        todos.classList.toggle("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrartratamientos.jsp?datos=todo", true);
    }
    if(id===orden){
        orden.classList.toggle("active");
        adultos.classList.remove("active");
        ninos.classList.remove("active");
        bebes.classList.remove("active");
        todos.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrartratamientos.jsp?datos=orden", true);
    }
    if(id===adultos){
        orden.classList.remove("active");
        adultos.classList.toggle("active");
        ninos.classList.remove("active");
        bebes.classList.remove("active");
        todos.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrartratamientos.jsp?datos=adult", true);
    }
    if(id===ninos){
        orden.classList.remove("active");
        adultos.classList.remove("active");
        ninos.classList.toggle("active");
        bebes.classList.remove("active");
        todos.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrartratamientos.jsp?datos=nn", true);
    }
    if(id===bebes){
        orden.classList.remove("active");
        adultos.classList.remove("active");
        ninos.classList.remove("active");
        bebes.classList.toggle("active");
        todos.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrartratamientos.jsp?datos=bb", true);
    }
    xmlhttp.send();
    
}

function edit(id){
    const xhttp = new XMLHttpRequest();
    var container = document.getElementById('editContainer');
    xhttp.onreadystatechange = function(){
        container.innerHTML = xhttp.responseText;
    };
    
    xhttp.open("GET","vista/ajaxpages/editarprescripcion.jsp?datos="+id, true);
//    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();
}

function hideInputs(){
    document.getElementById('editContainer').innerHTML = "";
}

//-------------------------DATATABLE---------------------------------

$(document).ready(function () {

    var table = $("#tabb").DataTable({
        paging: false,
        info: false,
        searching: false,
        language:  {
            searchPlaceholder: "Buscar...",
            search: "_INPUT_",
            emptyTable: "No se ha encontrado ningun resultado",
            info: "Mostrando _START_ a _END_ de _TOTAL_ coincidencias",
            infoEmpty: "Mostrando 0 a 0 de 0 registros",
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
                data: "medicamento",
                sortable: false
            },
            {
                data: "cantidad",
                sortable: false
            },
            {
                data: "dosis",
                sortable: false
            },
            {
                data: "frecuencia",
                sortable: false
            },
            {
                data: "categoria",
                sortable: false
            },
            {
                data: "enfermedad",
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
