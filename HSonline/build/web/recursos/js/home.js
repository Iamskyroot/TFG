/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//horario 
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('tablero');
    var calendar = new FullCalendar.Calendar(calendarEl, {

        theme: true,
        headerToolbar: {
            
            left: "",
            center: "",
            right: ""
        },
        locale: "es",
        selectable: true,
        initialView: 'timeGridDay',
        color: {color: "#fff", backgroudColor: "#269abc"},
//        eventSources: ["vista/ajaxpages/calendar.jsp"],
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