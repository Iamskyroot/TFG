/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    //listar los horarios diarios y activar el dia actual
    listSchedules(getCurrentDay(),document.getElementById(getCurrentDay2()));
});

//obtener el texto del dia actual
function getCurrentDay(){
    const date = new Date();
    const weekDay = ["domingo","lunes","martes","miercoles","jueves","viernes","sabado"];
    var currentDay = weekDay[date.getDay()];
    console.log("Hoy es: "+currentDay);
    return currentDay;
}
//obtener el texto del dia actual abreviado
function getCurrentDay2(){
    const date = new Date();
    const weekDay = ["dom","lun","mar","mie","jue","vie","sab"];
    var currentDay = weekDay[date.getDay()];
    console.log("Hoy es--: "+currentDay);
    return currentDay;
}

function listSchedules(day,idDia){
    var lun = document.getElementById('lun'),
            mar = document.getElementById('mar'),
            mie = document.getElementById('mie'),
            jue = document.getElementById('jue'),
            vie = document.getElementById('vie'),
            sab = document.getElementById('sab'),
            dom = document.getElementById('dom');
    var url ="vista/ajaxpages/listarhorarios.jsp?dia="+day;
    
    switch(idDia){
        case lun:
            lun.classList.add('active');
            mar.classList.remove('active');
            mie.classList.remove('active');
            jue.classList.remove('active');
            vie.classList.remove('active');
            sab.classList.remove('active');
            dom.classList.remove('active');
            break;
        case mar:
            lun.classList.remove('active');
            mar.classList.add('active');
            mie.classList.remove('active');
            jue.classList.remove('active');
            vie.classList.remove('active');
            sab.classList.remove('active');
            dom.classList.remove('active');
            break;
        case mie:
            lun.classList.remove('active');
            mar.classList.remove('active');
            mie.classList.add('active');
            jue.classList.remove('active');
            vie.classList.remove('active');
            sab.classList.remove('active');
            dom.classList.remove('active');
            break;
        case jue:
            lun.classList.remove('active');
            mar.classList.remove('active');
            mie.classList.remove('active');
            jue.classList.add('active');
            vie.classList.remove('active');
            sab.classList.remove('active');
            dom.classList.remove('active');
            break;
        case vie:
            lun.classList.remove('active');
            mar.classList.remove('active');
            mie.classList.remove('active');
            jue.classList.remove('active');
            vie.classList.add('active');
            sab.classList.remove('active');
            dom.classList.remove('active');
            break;
        case sab:
            lun.classList.remove('active');
            mar.classList.remove('active');
            mie.classList.remove('active');
            jue.classList.remove('active');
            vie.classList.remove('active');
            sab.classList.add('active');
            dom.classList.remove('active');
            break;
        case dom:
            lun.classList.remove('active');
            mar.classList.remove('active');
            mie.classList.remove('active');
            jue.classList.remove('active');
            vie.classList.remove('active');
            sab.classList.remove('active');
            dom.classList.add('active');
            break;
    }
    sendRequestSchedules(url);
}

function sendRequestSchedules(url){
    const http = new XMLHttpRequest();
    http.onreadystatechange = function(){
        document.getElementById('scheduleContainer').innerHTML = http.responseText;
    };
    http.open("GET", url);
    http.send();
}
