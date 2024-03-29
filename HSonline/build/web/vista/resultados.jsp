<%@page import="modelo.Sanitario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consultas</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
        <link href="<%=request.getContextPath()%>/datatable/buttons.dataTables.min.css" rel="stylesheet"/>
        <link href="<%=request.getContextPath()%>/datatable/datatables.min.css" rel="stylesheet"/>
        <link href="<%=request.getContextPath()%>/datatable/dataTables.bootstrap5.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/estilos_resultados.css"/>
    </head>

    <body>
        <%@include file="no_session.jsp"%>
        <% Sanitario usu = (Sanitario) session.getAttribute("usuario"); %>
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
                            <a href="#" title="Agenda">
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
                        <%}
                            }%>
                    <li><a href="Controlador?menu=Pacientes&accion=Listar&page=1" title="Pacientes">
                            <span class="icon"><i class="fas fa-users"></i></span>
                            <span class="link-text">Pacientes</span>
                        </a></li>
                        <%
                            if (usu != null) {
                                if (!usu.getEspecialidad().equalsIgnoreCase("recepcionista") && !usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {
                        %>
                    <li><a href="Controlador?menu=Consultas&accion=Listar&page=1" class="link-active" title="Consultas">
                            <span class="icon"><i class="fas fa-stethoscope"></i></span>
                            <span class="link-text">Consultas</span>
                        </a></li>

                    <li><a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=1" title="Tratamientos">
                            <span class="icon"><i class="fas fa-pills"></i></span>
                            <span class="link-text">Tratamientos</span>
                        </a></li>
                        <%}
                            }%>
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
                        <%}
                            }%>
                    <li><a href="CtrlHistorial?menu=Historial&accion=Listar&page=1"  title="Historias clinicas">
                            <span class="icon"><i class="fas fa-file-alt"></i></span>
                            <span class="link-text">Historias clinicas</span>
                        </a></li>

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

                        <div class="top_container filter_div">

                            <a class="filter_item active" id="todo" href="#" onclick="filtrarConsultas(this)"><i class="fas fa-list-ol"></i> Todos</a>
                            <a class="filter_item" id="dia" href="#" onclick="filtrarConsultas(this)"><i class="fas fa-calendar-day"></i> Hoy</a>
                            <a class="filter_item" id="semana" href="#" onclick="filtrarConsultas(this)"><i class="fas fa-calendar-week"></i> Esta semana</a>


                        </div>
                        <div class="top_container">
                            <div id="export" class="filter_div"></div>
                            <div class="search_div">

                                <input type="search" name="txtBuscar" id="txt" class="inp_search" placeholder="Buscar paciente"
                                       onkeyup="buscarConsulta(this.value)" autofocus>
                                <button type="button" class="btn_search" onclick="buscarConsulta(document.getElementById('txt').value)"><i class="fas fa-search"></i></button>
                                <!--                    <form action="Controlador?menu=Pacientes&accion=Buscar" method="post">
                                                        <input type="submit" name="" class="btn_search" value="Buscar">
                                                    </form>-->
                            </div>
                        </div>


                        <div class="table-responsive">
                            <table class="table table-hover table-striped " id="tab2">
                                <thead>
                                    <tr>
                                        <!--<td></td>-->
                                        <td>ID</td>
                                        <td>Paciente</td>
                                        <td>Pruebas ordenadas</td>
                                        <td>Dianostico</td>
                                        <td>fecha</td>
                                        <td>Acciones</td>
                                    </tr>
                                </thead>
                                <tbody id="res">
                                    <c:forEach  items="${consultas}" var="consultas">
                                        <tr>
                                            <!--<td><input type="checkbox" name="codConsulta" value="${consultas.getCodigo()}"></td>-->
                                            <td>${consultas.getCodigo()}</td>
                                            <td>${consultas.getPaciente_id()}</td>
                                            <td>${consultas.getPruebas()}</td>
                                            <td>${consultas.getDianosticos()}</td>
                                            <td>${consultas.getFecha_consulta()}</td>
                                            <td class="btn-group-sm">
                                                <a class="btn btn-success" href="#" onclick="editConsulta(${consultas.getPaciente_id()},${consultas.getCodigo()})" title="Editar"><i class="far fa-edit"></i></a>
                                                <a class="btn btn-warning" href="archivar?menu=Consultas&accion=Archivar&codConsulta=${consultas.getCodigo()}&codPaciente=${consultas.getPaciente_id()}&mId=${consultas.getMedico_id()}&page=${pagActual}" title="Archivar"><i style="color:white" class="fas fa-download"></i></a>
                                                <a class="btn btn-info" href="Controlador?menu=Detalles&accion=Mostrar&codPaciente=${consultas.getPaciente_id()}&codConsulta=${consultas.getCodigo()}&mId=${consultas.getMedico_id()}" target="blank" title="Mostrar detalles"><i class="fas fa-eye"></i></a>
                                            </td>
    <!--                                            <td><a style="color: green" href="Controlador?menu=ActualizarConsulta&accion=Buscar&codPaciente=${consultas.getPaciente_id()}&codConsulta=${consultas.getCodigo()}" title="Editar"><i class="far fa-edit"></i></a></td>
                                            <td><a style="color: red" href="Controlador?menu=Resultados&accion=Eliminar&codConsulta=${consultas.getCodigo()}" title="Eliminar"><i class="far fa-trash-alt"></i></a></td>
                                            <td><a style="color: #269abc" href="Controlador?menu=Detalles&accion=Mostrar&codPaciente=${consultas.getPaciente_id()}&codConsulta=${consultas.getCodigo()}" title="Mostrar detalles"><i class="far fa-address-card"></i></a></td>-->
                                                                                <!--<a class="btn btn-success" onclick="editConsulta()" href="Controlador?menu=ActualizarConsulta&accion=Buscar&codPaciente=${consultas.getPaciente_id()}&codConsulta=${consultas.getCodigo()}" title="Editar"><i class="far fa-edit"></i></a>-->
                                    <!--                                            <td><a class="btn-act btn-delete" href="Controlador?menu=Consultas&accion=Eliminar&codConsulta=${consultas.getCodigo()}" title="Eliminar"><i class="far fa-trash-alt"></i></a></td>
                                                                                <td><a class="btn-act btn-detail" href="Controlador?menu=Detalles&accion=Mostrar&codPaciente=${consultas.getPaciente_id()}&codConsulta=${consultas.getCodigo()}&mId=${consultas.getMedico_id()}" title="Mostrar detalles"><i class="far fa-address-card"></i></a></td>-->
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="paginacion">
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual != 1}">
                                    <a href="Controlador?menu=Consultas&accion=Listar&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                                    </c:if>
                                <!--displaying page numbers-->
                                <c:forEach begin="1" end="${noPag}" var="i">
                                    <c:choose>
                                        <c:when test="${pagActual eq i}">
                                            <a href="Controlador?menu=Consultas&accion=Listar&page=${i}" class="active">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="Controlador?menu=Consultas&accion=Listar&page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual lt noPag}">
                                    <a href="Controlador?menu=Consultas&accion=Listar&page=${pagActual + 1}"><i class="fas fa-angle-double-right"></i></a>
                                    </c:if>

                            </div>
                            <label style="float: right;font-weight: bold;margin-right: 10px">Total: ${noFilas}</label>

                        </div>

                    </div>
                </div>


            </div>
            <!--edit modal-->
            <div class="modal" id="editConsulta">

                <div class="form-popup animate">
                    <form action="dianostico" method="post" class="form-container" autocomplete="off">
                        <h2>Editar consulta</h2>
                        <div>
                            <!--Paciente: ${datos.get(0).getCodigo()}-->
                            <label id="lblP">Paciente n�: </label>
                            <input type="text" name="codPaciente" id="idPaciente" style="border:none;outline: none; font-weight: bold;">
                        </div>


                        <div>

                            <label id="codigoConsulta">Consulta n�: </label>
                            <input type="text" name="codConsulta" id="idConsulta" style="border:none;outline: none; font-weight: bold;">
                        </div>
                        <fieldset class="seccion_form">
                            <legend>Datos de la consulta</legend>
                            
                            <p class="acordeon" id="acordeon">Dianostico</p>
                            <div class="panel" id="panel">

                                <p style="color: #269abc">NOTA: Seleccione las enfermedades en las que el paciente ha dado positivo</p>
                                <ul id="listaEnfer" class="lista">
                                    <c:forEach items="${pruebas}" var="pru">

                                        <li><label><input type="checkbox" name="p" value="${pru.getEnfermedad()}"> ${pru.getEnfermedad()}</label></li>

                                    </c:forEach>
                                </ul>
                            </div>
                            <p class="acordeon" id="acordeon">Tratamiento</p>
                            <div class="panel" id="panel">

                                <!--                                filter-->
                                <input type="text" id="txtBuscar" onkeyup="filtrarLista()" placeholder="Buscar tratamientos.." title="Escriba un tratamiento">

                                <ul id="listaTrata" class="lista">
                                    <c:forEach items="${tratamientos}" var="t">

                                        <li><label><input type="checkbox" name="trata" value="${t.getCodigo_tratamiento()}"> ${t.getEnfermedad()} ${t.getCategoria()}</label></li>

                                    </c:forEach>                        
                                </ul>

                            </div>
                            <div class="row btn">
                                <label style="font-size: 18px; margin-right: 20px;">
                                    <input type="checkbox" name="hospitalizar" value="hospitalizado"> Hospitalizar paciente
                                </label>
                            </div>
                        </fieldset>

                        <div class="f_row">
                            <input type="submit" class="btn_guardar" name="accion" value="Guardar cambios">  
                        </div>

                    </form>
                    <span class="cancel" onclick="closeForm(document.getElementById('editConsulta'))" title="Cerrar el formulario">&times;</span>
                </div>
            </div>
        </div>

        <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/mod_interconsulta.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/buttons.dataTables.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/datatables.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/pdfmake.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/vfs_fonts.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/jszip.min.js" type="text/javascript"></script>

    </body>
</html>