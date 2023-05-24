<%-- 
    Document   : gestion_doctores
    Created on : 23-dic-2022, 13:17:54
    Author     : Skyroot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion Hospitalaria->historial</title>
        <link href="recursos/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/historial.css" rel="stylesheet" type="text/css"/>
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
            <li class="n_item enlaces active"><a href="CtrlHistorial?menu=Historial">Historial clinico</a></li>
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

            <div class="main_container">
                <div class="searchbar">
                    <form>
                        <input type="search" name="txt" placeholder="Buscar historial...">
                        <button type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>

                <div class="top_container">
                    <a class="filter_item" href="#"><i class="fas fa-list-ol"></i> Todos</a>
                    <a class="filter_item" href="#"><i class="fas fa-calendar-day"></i> Hoy</a>
                    <a class="filter_item" href="#"><i class="fas fa-calendar-week"></i> Esta semana</a>
                    <a class="filter_item" href="#"><i class="fas fa-sort-alpha-up"></i> Orden alfabetico</a>
                </div>
                <div class="container_table">
                    <table>
                        <thead>
                            <tr>
                                <td>Id</td>
                                <td>Nombre</td>
                                <td>Fecha</td>
                                <td></td>
                            </tr>
                        <thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><a href="">Nombre ejemplo1</a></td>
                                <td>31-01-2023</td>
                                <td><button><a href="#"><i class="fas fa-address-card"></i></a></button></td>
                                <!--<td><button><a href="#"><i class="fas fa-edit"></i></a></button></td>-->
                            </tr>
                        <tbody>
                    </table>
                    
                    <div class="paginacion">
                        <a href="#">&laquo;</a>
                        <a href="#" class="active">1</a>
                        <a href="#">&raquo;</a>
                    </div>
                    
                    <div class="numrow">
                        <label>Cantidad: 1</label>
                    </div>
                    
                </div>

            </div>

        </div>


        <script src="recursos/js/header.js" type="text/javascript"></script>
    </body>
</html>
