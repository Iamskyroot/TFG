<%-- 
    Document   : gestion_doctores
    Created on : 23-dic-2022, 13:17:54
    Author     : Skyroot
--%>

<%@page import="modelo.Sanitario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Tratamiento"%>
<%@page import="modelo.PrescripcionDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Prescripcion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tratamientos</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
    <link href="<%=request.getContextPath()%>/datatable/buttons.dataTables.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/datatable/datatables.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
    <link href="<%=request.getContextPath()%>/recursos/css/tratamientos.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
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
                <li><a href="Controlador?menu=Consultas&accion=Listar&page=1" title="Consultas">
                        <span class="icon"><i class="fas fa-stethoscope"></i></span>
                        <span class="link-text">Consultas</span>
                    </a></li>

                <li><a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=1" class="link-active" title="Tratamientos">
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
                <li><a href="#" onclick="toggleActive(this)" id="horario" title="Horarios">
                        <span class="icon"><i class="fas fa-user-md"></i></span>
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
        <div class="content" id="main">
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

                        <a class="filter_item active" id="todo" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-list-ol"></i> Todos</a>
                        <a class="filter_item" id="orden" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-sort-alpha-down"></i> Orden alfabetico</a>
                        <a class="filter_item" id="adult" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-male"></i> Adultos</a>
                        <a class="filter_item" id="nn" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-child"></i> Niños</a>
                        <a class="filter_item" id="bb" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-baby"></i> Bebés</a>

                    </div>
                    <div class="top_container">
                        <div id="export" class="filter_div"></div>
                        <div class="search_div">
                            <input type="search" id="txt" name="txtBuscar" class="inp_search" onkeyup="buscarTratamiento(this.value)" 
                                   placeholder="Buscar..." autofocus>
                            <!--<input type="submit" name="" class="btn_search" value="Buscar">-->
                            <button type="button" class="btn_search" onclick="buscarTratamiento(document.getElementById('txt').value)"><i class="fas fa-search"></i></button>
                            <!--                    <form action="RegistrarConsulta?accion=Buscar" method="post">
                                                </form>-->
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="tabb">
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Medicamento</td>
                                    <td>Cantidad</td>
                                    <td>Dosis</td>
                                    <td>Frecuencia</td>
                                    <td>Categoria</td>
                                    <td>Enfermedad</td>
                                    <td>Acciones</td>
                                </tr>
                            </thead>
                            <tbody id="res">
                                <c:forEach items="${datos}" var="datos">
                                    <tr>
                                        <td>${datos.getCodigo()}</td>
                                        <td>${datos.getMedicamento()}</td>
                                        <td>${datos.getCantidad()}</td>
                                        <td>${datos.getDosis()}</td>
                                        <td>${datos.getFrecuencia()}</td>
                                        <td>${datos.getCategoria()}</td>
                                        <td>${datos.getEnfermedad()}</td>
                                        <td class="btn-group-sm">
                                            <a class="btn btn-success" href="#" onclick="edit(${datos.getCodigo()})" title="Editar prescripcion"><i class="far fa-edit"></i></a>
                                            <a class="btn btn-danger" href="#" onclick="eliminarPrescripcion(${datos.getCodigo()},'${datos.getMedicamento()}')" title="Eliminar"><i class="far fa-trash-alt"></i></a>
                                        </td>
<!--                                        <td><a class="btn btn-success" href="#" onclick="edit(${datos.getCodigo()})" title="Editar prescripcion"><i class="far fa-edit"></i></a></td>
                                        <td><a class="btn btn-danger" href="CtrlTratamiento?menu=Tratamiento&accion=eliminar&id=${datos.getCodigo()}" title="Eliminar"><i class="far fa-trash-alt"></i></a></td>-->
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div id="editContainer" style="padding: 10px;margin-top: 10px;border: 1px solid #ddd"></div>

                        <div class="paginacion">
                            <!--display previous link except for the first page-->
                            <c:if test="${pagActual != 1}">
                                <a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                                </c:if>
                            <!--displaying page numbers-->
                            <c:forEach begin="1" end="${noPaginas}" var="i">
                                <c:choose>
                                    <c:when test="${pagActual eq i}">
                                        <a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=${i}" class="active">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=${i}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <!--display previous link except for the first page-->
                            <c:if test="${pagActual lt noPag}">
                                <a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=${pagActual + 1}"><i class="fas fa-angle-double-right"></i></a>
                                </c:if>

                        </div>
                        <label style="float: right;font-weight: bold">Total: ${total}</label>

                    </div>
                </div>

                <!-- Add and popup form -->
                <button class="open-button" onclick="openForm()" title="Añadir un nuevo tratamiento"><i class="fas fa-plus"></i></button>

                <div class="modal" id="modal">

                    <div class="form-popup animate">
                        <form action="RegistrarTratamiento?accion=Insertar" method="post" class="form-container">
                            <h2>Creacion de tratamiento</h2>
                            <fieldset>
                                <legend>Datos del tratamiento</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Enfermedad</label>
                                        <input type="text" name="enfermedad" class="f_txt" placeholder="Nombre enfermedad" required>
                                    </div>

                                </div>
                                <div class="f_row">

                                    <div class="f_column">
                                        <label>Categoria o rango de edad(meses o años)</label>
<!--                                        <select name="tipo" class="f_txt" required>
                                            <option value=""></option>
                                            <option value="bebes">Bebés</option>
                                            <option value="ninos">Niños</option>
                                            <option value="adultos">Adultos</option>
                                        </select>-->
                                        <input type="text" name="tipo" class="f_txt" placeholder="categoria" required>
                                    </div>
                                </div>

                            </fieldset>

                            <fieldset class="receta" id="receta">
                                <legend>Instrucciones</legend>
                                <div class="f_row" id="row1">
                                    <div class="f_column">
                                        <label>Medicamento</label>
                                        <input type="text" name="medicamento" class="f_txt" placeholder="Nombre del medicamento" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Cantidad</label>
                                        <input type="text" name="cantidad" class="f_txt" placeholder="Cantidad" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Dosis</label>
                                        <input type="text" name="dosis" class="f_txt" placeholder="Dosis" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Frecuencia</label>
                                        <input type="terxt" name="frecuencia" class="f_txt" placeholder="00-00-00" required>
                                    </div>
                                    <button type="button" id="btnadd" onclick="crearCampos()" class="row_btn" title="Crear otra fila"><i class="fas fa-plus"></i></button>
                                </div>
                            </fieldset>

                            <div class="f_row">
                                <button type="submit" class="btn_guardar">Guardar</button>
                            </div>

                            <span class="cancel" onclick="closeForm()" title="Cerrar el formulario">&times;</span>
                        </form>
                    </div>

                </div>

            </div>
        </div>

        <script src="<%=request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/jquery-ui.min.js"></script>
        <script src="<%=request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/recursos/js/admin_panel.js"></script>
        <script src="<%=request.getContextPath()%>/recursos/js/mod_tratamiento.js"></script>
        <script src="<%= request.getContextPath()%>/datatable/buttons.dataTables.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/datatables.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/pdfmake.min.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/vfs_fonts.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/datatable/jszip.min.js" type="text/javascript"></script>

</body>
</html>
