<%@page import="modelo.Sanitario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Historias clicnicas</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/estilos_resultados.css"/>
        <link href="<%=request.getContextPath()%>/recursos/css/historial.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
    </head>

    <body>
        <%@include file="no_session.jsp"%>
        <% Sanitario usu = (Sanitario) session.getAttribute("usuario");%>
        <div class="main">
            <div class="navbar-side">
                <h6>
                    <!--<span class="icon"><i class="fas fa-hospital"></i></span>-->
                    <span class="link-text">HS online</span>
                </h6>
                <ul>
                    <li><a href="Controlador?menu=Principal" id="home" title="Principal">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            <span class="link-text">Principal</span>
                        </a></li>
                    <li>
                        <a href="#" onclick="toggleActive(this)" id="citas" class="myBtn" data-toggle="collapse" data-target="#my-sub" title="Citas" aria-expanded="false">
                            <span class="icon"><i class="fas fa-calendar-plus"></i></span>
                            <span class="link-text">Citas</span>
                            <span class="ml-auto myCaret"></span>
                        </a>
                        <div id="my-sub" class="collapse bg-secondary">
                            <a href="CtrlCitas?menu=Citas&accion=listar&page=1" title="Solicitudes">
                                <span class="icon"><i class="fas fa-users"></i></span>
                                <span class="link-text">Solicitudes</span>
                            </a>
                            <a href="CtrlCitas?menu=Agenda" title="Agenda">
                                <span class="icon"><i class="fas fa-calendar-week"></i></span>
                                <span class="link-text">Agenda</span>
                            </a>
                        </div>
                    </li>
                    <%
                        if (usu != null) {
                         if (usu.getEspecialidad().equalsIgnoreCase("admin") && (!usu.getEspecialidad().equalsIgnoreCase("enfermeria") || usu.getEspecialidad().equalsIgnoreCase("recepcionista"))) {
                    %>
                    <li><a href="CtrlDoctores?menu=Doctores&accion=Listar&page=1" title="Personal sanitario">
                            <span class="icon"><i class="fas fa-user-md"></i></span>
                            <span class="link-text">Personal sanitario</span>
                        </a></li>
                        <%}}%>
                    <li><a href="Controlador?menu=Pacientes&accion=Listar&page=1" title="Pacientes">
                            <span class="icon"><i class="fas fa-users"></i></span>
                            <span class="link-text">Pacientes</span>
                        </a></li>
                        <%
                            if (usu != null) {
                            if (!usu.getEspecialidad().equalsIgnoreCase("recepcionista") && !usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {
                        %>
                    <li><a href="Controlador?menu=Consultas&accion=Listar&page=1" title="Consultas">
                            <span class="icon"><i class="fas fa-stethoscope"></i></span>
                            <span class="link-text">Consultas</span>
                        </a></li>
                        
                    <li><a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=1" title="Tratamientos">
                            <span class="icon"><i class="fas fa-pills"></i></span>
                            <span class="link-text">Tratamientos</span>
                        </a></li>
                        <%}}%>
                    <li><a href="CtrlHospitalizacion?menu=Hospitalizacion&accion=Listar&page=1" title="Hospitalizaciones">
                            <span class="icon"><i class="fas fa-procedures"></i></span>
                            <span class="link-text">Hospitalizaciones</span>
                        </a></li>
                        <%
                            if (usu != null) {
                            if (usu.getEspecialidad().equalsIgnoreCase("admin") && (!usu.getEspecialidad().equalsIgnoreCase("enfermeria") || usu.getEspecialidad().equalsIgnoreCase("recepcionista"))) {
                        %>
                    <li><a href="Horario?menu=Horario&accion=Listar&page=1" id="horario" title="Horarios">
                            <span class="icon"><i class="fas fa-calendar-week"></i></span>
                            <span class="link-text">Horarios</span>
                        </a></li>
                        <%}}%>
                        <%
                            if (usu != null) {
                            if (!usu.getEspecialidad().equalsIgnoreCase("recepcionista") && !usu.getEspecialidad().equalsIgnoreCase("recepcionista")){
                        %>
                        <li><a href="CtrlHistorial?menu=Historial&accion=Listar&page=1" class="link-active"  title="Historias clinicas">
                            <span class="icon"><i class="fas fa-file-alt"></i></span>
                            <span class="link-text">Historias clinicas</span>
                        </a></li>
                       <%}}%> 
                        <li><a href="Controlador?menu=Perfil&accion=perfil" title="Mi perfil">
                            <span class="icon"><i class="fas fa-user-circle"></i></span>
                            <span class="link-text">Mi perfil</span>
                        </a></li>
                    <!-- <li><a href="#" title="Setting">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="link-text">Setting</span>
                      </a></li> -->
                    <!--        <li><a href="#" onclick="toggleActive(this)" id="quit" title="Cerrar sesion">
                                <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
                                <span class="link-text">Cerrar sesion</span>
                              </a></li>-->
                </ul>
            </div>

            <div class="content">
                <nav class="navbar navbar-dark bg-dark py-1">

                    <a href="#" id="navBtn">
                        <span id="changeIcon" class="fa fa-bars text-light"></span>
                    </a>

                    <div class="d-flex">

                        <a class="nav-link text-light px-2"><i class="fas fa-user-circle"></i> ${usuario.getNombre()}</a> 
                        <a class="nav-link text-light px-2" href="CerrarSesion?accion=logout" title="Cerrar sesion"> <i class="fas fa-power-off"></i></a>
                    </div>

                </nav>


                <div class="container-fluid">
                    ${alert}
                    <div class="container-data">
                        ${estado}
                        <div class="top_container">
                            <div class="filter_div">

                                <a class="filter_item active" id="todo" href="#" onclick="filtrarHc(this)"><i class="fas fa-list-ol"></i> Todos</a>
                                <a class="filter_item" id="dia" href="#" onclick="filtrarHc(this)"><i class="fas fa-calendar-day"></i> Hoy</a>
                                <a class="filter_item" id="semana" href="#" onclick="filtrarHc(this)"><i class="fas fa-calendar-week"></i> Esta semana</a>


                            </div>
                            <div class="search_div">

                                <input type="search" name="txtBuscar" id="txt" class="inp_search" placeholder="Buscar paciente"
                                       onkeyup="buscarHc(this.value)" autofocus>
                                <button type="button" class="btn_search" onclick="buscarHc(document.getElementById('txt').value)"><i class="fas fa-search"></i></button>
                                <!--                    <form action="Controlador?menu=Pacientes&accion=Buscar" method="post">
                                                        <input type="submit" name="" class="btn_search" value="Buscar">
                                                    </form>-->
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <td>Id</td>
                                        <td>ID consulta</td>
                                        <td>ID paciente</td>
                                        <td>Fecha archivado</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody id="res">
                                    <c:forEach items="${historias}" var="h">
                                        <tr>
                                            <td>${h.getNombre_hc()}</td>
                                            <td><a href="CtrlHistorial?menu=Historial&accion=Mostrar&hId=${h.getNombre_hc()}&codPaciente=${h.getPaciente_id()}&codConsulta=${h.getConsulta_id()}&mId=${h.getMedico_id()}">${h.getConsulta_id()}</a></td>
                                            <td><a href="CtrlHistorial?menu=Historial&accion=Mostrar&hId=${h.getNombre_hc()}&codPaciente=${h.getPaciente_id()}&codConsulta=${h.getConsulta_id()}&mId=${h.getMedico_id()}">${h.getPaciente_id()}</a></td>
                                            <td>${h.getFecha()}</td>
                                            <td><a href="CtrlHistorial?menu=Historial&accion=Mostrar&hId=${h.getNombre_hc()}&codPaciente=${h.getPaciente_id()}&codConsulta=${h.getConsulta_id()}&mId=${h.getMedico_id()}" class="btn btn-info"><i class="fas fa-eye"></i></a></td>
                                            <!--<td><button><a href="#"><i class="fas fa-edit"></i></a></button></td>-->
                                        </tr>
                                    </c:forEach>

                                <tbody>
                            </table>

                            <div class="paginacion">
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual != 1}">
                                    <a href="CtrlHistorial?menu=Historial&accion=Listar&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                                    </c:if>
                                <!--displaying page numbers-->
                                <c:forEach begin="1" end="${noPag}" var="i">
                                    <c:choose>
                                        <c:when test="${pagActual eq i}">
                                            <a href="CtrlHistorial?menu=Historial&accion=Listar&page=${i}" class="active">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="CtrlHistorial?menu=Historial&accion=Listar&page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual lt noPag}">
                                    <a href="CtrlHistorial?menu=Historial&accion=Listar&page=${pagActual + 1}"><i class="fas fa-angle-double-right"></i></a>
                                    </c:if>

                            </div>
                            <label style="float: right;font-weight: bold;margin-right: 10px">Total: ${noFilas}</label>

                        </div>


                    </div>
                </div>


            </div>

        </div>

        <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/mod_hc.js" type="text/javascript"></script>

    </body>
</html>