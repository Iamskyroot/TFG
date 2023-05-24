/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function openFormEdit(id, nom, sala, habitacion, cama, estado) {
    document.getElementById('editarIngreso').style.display = "block";
    document.getElementById('idPaciente').value = id;
    document.getElementById('nomPaciente').value = nom;
    document.getElementById('sala').value = sala;
    document.getElementById('habitacion').value = habitacion;
    document.getElementById('cama').value = cama;
    document.getElementById('estado').innerHTML = estado;

}

//buscar hospitalizados
function buscarHospitalizados(datos){
    
    const xmlhttp = new XMLHttpRequest();
    var res =  document.getElementById("res");
    xmlhttp.onreadystatechange = function (){
        res.innerHTML = xmlhttp.responseText;
    };
    
    xmlhttp.open("GET", "vista/ajaxpages/buscarhospitalizados.jsp?datos="+datos,true);
    xmlhttp.send();
    
}

//filtrar hospitalizados
function filtrarHospitalizados(id){
    
    const xmlhttp = new XMLHttpRequest();
    var res =  document.getElementById("res");
    var todo =  document.getElementById("todo");
    var hospi =  document.getElementById("hospi");
    var alta =  document.getElementById("alta");
    var orden =  document.getElementById("orden");
    xmlhttp.onreadystatechange = function (){
        res.innerHTML = xmlhttp.responseText;
    };
    
    if (id===todo){
        todo.classList.toggle("active");
        hospi.classList.remove("active");
        alta.classList.remove("active");
        orden.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarhospitalizados.jsp?datos=todo",true);
    }
    if (id===hospi){
        todo.classList.remove("active");
        hospi.classList.toggle("active");
        alta.classList.remove("active");
        orden.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarhospitalizados.jsp?datos=hospitalizado",true);
    }
    if (id===alta){
        todo.classList.remove("active");
        hospi.classList.remove("active");
        alta.classList.toggle("active");
        orden.classList.remove("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarhospitalizados.jsp?datos=alta",true);
    }
    if (id===orden){
        todo.classList.remove("active");
        hospi.classList.remove("active");
        alta.classList.remove("active");
        orden.classList.toggle("active");
        xmlhttp.open("GET", "vista/ajaxpages/filtrarhospitalizados.jsp?datos=orden",true);
    }
    xmlhttp.send();
    
}

//-------------------------DATATABLE---------------------------------

$(document).ready(function () {

    var table = $("#tab").DataTable({
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
                data: "nombre"
            },
            {
                data: "sala"
            },
            {
                data: "habitacion",
                sortable: false
            },
            {
                data: "cama",
                sortable: false
            },
            {
                data: "estado",
                sortable: false
            },
            {
                data: "fecha"
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


