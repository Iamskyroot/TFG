
function buscarHc(data) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "vista/ajaxpages/historial.jsp?menu=buscar&datos=" + data, true);
    xmlhttp.send();
}

function filtrarHc(id) {
    var todos = document.getElementById("todo");
    var dia = document.getElementById("dia");
    var semana = document.getElementById("semana");
    var xmlhttp = new XMLHttpRequest();
//    var currentDate = new Date(date.getDay(),date.getMonth(),date.getFullYear());
    xmlhttp.onreadystatechange = function () {
        document.getElementById("res").innerHTML = xmlhttp.responseText;
    };

    if (id === todos) {
        dia.classList.remove("active");
        semana.classList.remove("active");
        todos.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/historial.jsp?menu=filtro&datos=todo", true);
    }
    if (id === dia) {
        semana.classList.remove("active");
        todos.classList.remove("active");
        dia.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/historial.jsp?menu=filtro&datos=diario", true);
    }
    if (id === semana) {
        todos.classList.remove("active");
        dia.classList.remove("active");
        semana.classList.add("active");
        xmlhttp.open("GET", "vista/ajaxpages/historial.jsp?menu=filtro&datos=semanal", true);
    }
    xmlhttp.send();

}


