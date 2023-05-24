<%-- 
    Document   : gestion_doctores
    Created on : 23-dic-2022, 13:17:54
    Author     : Skyroot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Orarios y programacion medica</title>
        <link rel="stylesheet" type="text/css" href="recursos/css/header.css">
        <link rel="stylesheet" type="text/css" href="recursos/css/doctores_2.css">
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <%@include file="no_session.jsp"%>

        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces "><a href="Controlador?menu=Principal">Principal</a></li>
            <li class="n_item enlaces"><a href="CtrlDoctores?menu=Doctores">Doctores</a></li>
            <li class="n_item enlaces active"><a href="CtrlDoctores?menu=Horarios">Horarios</a></li>
            <div class="n_item dropdown">
                <button class="dropbtn">
                    <i class="fas fa-user-circle" style="font-size: 24px"></i>
                    ${usuario.getNombre()}
                    
                </button>
                <div class="dropdown-content">
                    <div class="user-icon">U</div>
                    <div class="user-item"><span>${usuario.getNombre()}</span></div>
                    <a href="CerrarSesion?accion=logout">Cerrar sesion</a>
                </div>
            </div>
            <li class="btn_menu"><a href="javascript:void(0);" onclick="menuResponsive()">
                    <div class="open" id="open" title="Abrir menu">
                        <div class="m"></div>
                        <div class="m"></div>
                        <div class="m"></div>
                    </div>
                    <div class="close" id="close" title="Cerrar menu">&times;</div>
                </a></li>
        </ul>

        <div class="main">
            <div class="aside main-item">
                <form action="EditarHospitalizacion" method="post">
                    <label>Titulo del horario</label>
                    <input type="text" name="titulo" value="" placeholder="Titulo" class="aside-input" required>
                    <select class="aside-input">
                        <option value="">Turno</option>
                        <option value="1">Mañana</option>
                        <option value="2">Tarde</option>
                        <option value="3">Noche</option>
                    </select>
                    <button type="button" class="acordeon">Lunes</button>
                    <div  class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>
                    <button type="button" class="acordeon">Martes</button>
                    <div class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>
                    <button type="button" class="acordeon">Miercoles</button>
                    <div class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>
                    <button type="button" class="acordeon">Jueves</button>
                    <div class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>
                    <button type="button" class="acordeon">Viernes</button>
                    <div class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>
                    <button type="button" class="acordeon">Sabado</button>
                    <div class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>
                    <button type="button" class="acordeon">Domingo</button>
                    <div class="panel"><textarea class="aside-input" placeholder="Escriba los nombres aqui"></textarea></div>

                    <div class="aside-btn">
                        <input type="submit" name="accion" value="Guardar">
                    </div>                   
                </form>
            </div>

            <div class="main-container main-item">

                <div class="horario">
                    
                    <h3>Titulo del horario</h3>
                    <p id="fecha">21/01/2013</p>
                    <table>
                        <thead>
                            <tr>
                                <td>Turno</td>
                                <td>Lunes</td>
                                <td>Martes</td>
                                <td>Miercoles</td>
                                <td>Jueves</td>
                                <td>Viernes</td>
                                <td>Sabado</td>
                                <td>Domingo</td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Mañana</td>
                                <td>Nombre 2</td>
                                <td>Nombre 3</td>
                                <td>Nombre 4</td>
                                <td>Nombre 5</td>
                                <td>Nombre 6</td>
                                <td>Nombre 7</td>
                                <td>Nombre 8</td>
                            </tr>
                        </tbody>

                    </table>
                </div>

            </div>
        </div>

        <script type="text/javascript">
            
            /*acordeon horario*/
            var acc = document.getElementsByClassName("acordeon");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    /* Toggle between adding and removing the "active" class,
                     to highlight the button that controls the panel */
                    this.classList.toggle("active");

                    /* Toggle between hiding and showing the active panel */
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }

        </script>
        <script src="recursos/js/header.js" type="text/javascript"></script>

    </body>
</html>