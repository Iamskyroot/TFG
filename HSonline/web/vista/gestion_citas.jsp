<%-- 
    Document   : gestion_doctores
    Created on : 23-dic-2022, 13:17:54
    Author     : Skyroot
--%>

<%@page import="modelo.Sanitario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Citas</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
        <link href="<%=request.getContextPath()%>/datatable/buttons.dataTables.min.css" rel="stylesheet"/>
        <link href="<%=request.getContextPath()%>/datatable/datatables.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
        <link href="<%= request.getContextPath()%>/recursos/css/citas.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="no_session.jsp"%>
        <% Sanitario usu = (Sanitario) session.getAttribute("usuario"); %>
        <div class="main">
            <div class="navbar-side">
                <h6>
                    <!--<span class="icon"><i class="fas fa-h-square"></i></span>-->
                    <span class="link-text">HS online</span>
                </h6>
                <ul>
                    <li><a href="Controlador?menu=Principal" id="home" title="Principal">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            <span class="link-text">Principal</span>
                        </a></li>
                    <li>
                        <a href="#" class="myBtn link-active" data-toggle="collapse" data-target="#my-sub" title="Citas" aria-expanded="false">
                            <span class="icon"><i class="fas fa-calendar-plus"></i></span>
                            <span class="link-text">Citas</span>
                            <span class="ml-auto myCaret"></span>
                        </a>
                        <div id="my-sub" class="collapse bg-secondary">
                            <a href="CtrlCitas?menu=Citas&accion=listar&page=1" class="link-active" title="Solicitudes">
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
                        <%}
                            }%>
                    <li><a href="Controlador?menu=Pacientes&accion=Listar&page=1" title="Pacientes">
                            <span class="icon"><i class="fas fa-users"></i></span>
                            <span class="link-text">Pacientes</span>
                        </a></li>
                        <%
                            if (usu != null) {
                                if (!usu.getEspecialidad().equalsIgnoreCase("enfermeria") && !usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {
                        %>
                    <li><a href="Controlador?menu=Consultas&accion=Listar&page=1" title="Consultas">
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
                    <li><a href="#" onclick="toggleActive(this)" id="horario" title="Horarios">
                            <span class="icon"><i class="fas fa-user-md"></i></span>
                            <span class="link-text">Horarios</span>
                        </a></li>
                        <%}
                            }%>
                        <%
                            if (usu != null) {
                                if (!usu.getEspecialidad().equalsIgnoreCase("enfermeria") && !usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {
                        %>
                    <li><a href="CtrlHistorial?menu=Historial&accion=Listar&page=1"  title="Historias clinicas">
                            <span class="icon"><i class="fas fa-file-alt"></i></span>
                            <span class="link-text">Historias clinicas</span>
                        </a></li>
                        <%}
                           }%> 

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

                    <div class="container-data">
                        ${estado}
                        <div class="top_container filter_div">

                            <a class="filter_item active" id="todo" href="#" onclick="filtrarCitas(this)"><i class="fas fa-list-ol"></i> Todos</a>
                            <a class="filter_item" id="asig" href="#" onclick="filtrarCitas(this)"><i class="fas fa-user-check"></i> Asignado</a>
                            <a class="filter_item" id="unasig" href="#" onclick="filtrarCitas(this)"><i class="fas fa-user-times"></i>No asignado</a>

                        </div>
                        <div class="top_container">
                            <div id="export" class="filter_div"></div>
                            <div class="search_div" id="search">

                                <input type="search" name="txtBuscar" id="txt" class="inp_search" placeholder="Buscar paciente"
                                       onkeyup="buscarPaciente(this.value)" autofocus>
                                <button type="button" class="btn_search" onclick="buscarPaciente(document.getElementById('txt').value)"><i class="fas fa-search"></i></button>
                                <!--                                                    <form action="Controlador?menu=Pacientes&accion=Buscar" method="post">
                                                                                        <input type="submit" name="" class="btn_search" value="Buscar">
                                                                                    </form>-->
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-hover" id="tab">
                                <thead>
                                    <tr>


                                        <th>Nombre</th>
                                        <th>Motivo</th>
                                        <th>Servicio</th>
                                        <th>Fecha_solicitud</th>
                                        <th>Fecha_inicio</th>
                                        <th>Fecha_fin</th>
                                        <th>Medico</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="res">
                                    <c:forEach items="${citas}" var="c">
                                        <tr>


                                            <td>${c.getNombre()}</td>
                                            <td>${c.getMotivo()}</td>
                                            <td>${c.getServicio()}</td>
                                            <td>${c.getFecha_solicitud()}</td>
                                            <td>${c.getFecha_inicio()}</td>
                                            <td>${c.getFecha_fin()}</td>
                                            <td>${c.getMedico()}</td>
                                            <td class="btn-group-sm">
                                                <a class="btn btn-success" href="CtrlCitas?menu=Citas&accion=editar&id=${c.getCodigo()}" title="Editar solicitud"><i class="far fa-edit"></i></a>
                                                <a class="btn btn-danger" href="" title="Cancelar"><i class="fas fa-times"></i></a>
                                            </td>
                                            <!--<td><a class="btn btn-warning" href="vista/editar_solicitud.jsp" title=""><i class="fas fa-times"></i></a></td>-->
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="paginacion">
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual != 1}">
                                    <a href="CtrlCitas?menu=Citas&accion=listar&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                                    </c:if>
                                <!--displaying page numbers-->
                                <c:forEach begin="1" end="${noPag}" var="i">
                                    <c:choose>
                                        <c:when test="${pagActual eq i}">
                                            <a href="CtrlCitas?menu=Citas&accion=listar&page=${i}" class="active">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="CtrlCitas?menu=Citas&accion=listar&page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual lt noPag}">
                                    <a href="CtrlCitas?menu=Citas&accion=listar&page=${pageActual - 1}"><i class="fas fa-angle-double-right"></i></a>
                                    </c:if>

                            </div>
                            <label style="float: right;font-weight: bold;margin-right: 100px">Total: ${noFilas}</label>
                        </div>


                    </div>
                    <button class="open-button" onclick="openForm()" id="btnAdd" title="Añadir una nueva cita"><i class="fas fa-plus"></i></button>

                    <div class="modal" id="modal">
                        <div class="form-popup animate">
                            <form action="nuevacita" method="post" class="form-container">
                                <span class="cancel" onclick="closeForm()" title="Cerrar el formulario">&times;</span>
                                <h2>Agendar cita</h2>

                                <!-- Progress -->
                                <div class="progressbar">
                                    <div class="progress" id="progress"></div>
                                    <div class="progress-step progress-step-active" data-title="Personal"></div>
                                    <div class="progress-step" data-title="Usuario"></div>
                                    <div class="progress-step" data-title="Cita"></div>
                                    <div class="progress-step" data-title="Guardar"></div>
                                </div>
                                <!-- 4teps -->

                                <div class="form-step form-step-active">

                                    <div class="input_group">
                                        <div class="f_row">
                                            <div class="f_column">
                                                <label>Nombre(obligatorio)</label>
                                                <input type="text" name="nombre" class="f_txt" placeholder="Nombre completo" required>
                                            </div>
                                            <div class="f_column">
                                                <label>Edad(obligatorio)</label>
                                                <input type="number" name="edad" min="18" class="f_txt" placeholder="edad" required>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="input_group">
                                        <div class="f_row">

                                            <div class="f_column">
                                                <label>Sexo(obligatorio)</label>
                                                <select name="sexo" class="f_txt esp" required>
                                                    <option></option>
                                                    <option>Hombre</option>
                                                    <option>Mujer</option>
                                                </select>
                                            </div>

                                            <div class="f_column">
                                                <label>Documento(obligatorio)</label>
                                                <input type="text" name="doc" class="f_txt" placeholder="Nº DIP o pasaporte">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input_group">
                                        <div class="f_row">

                                            <div class="f_column">
                                                <label>Direccion(obligatorio)</label>
                                                <input type="text" name="dir" class="f_txt" placeholder="Direccion" required>
                                            </div>

                                            <div class="f_column">
                                                <label>Telefono(opcional)</label>
                                                <input type="text" name="tel" class="f_txt" placeholder="Telefono">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="">
                                        <a href="#" class="btn next-btn size_50 ml_auto">Siguiente</a>
                                    </div>
                                </div>
                                <div class="form-step">

                                    <div class="input_group">
                                        <div class="f_row">
                                            <div class="f_column">
                                                <label>Usuario</label>
                                                <input type="text" name="user" id="user" class="f_txt" placeholder="Nombre de usuario">
                                            </div>
                                            <div class="f_column">
                                                <label>Contraseña</label>
                                                <input type="password" name="passw" id="passw" class="f_txt" placeholder="Contraseña">
                                                <i class="fas fa-eye-slash show-passw" id="showPassw" onclick="showPassword(this, document.getElementById('passw'))"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input_group">
                                        <div class="f_row">
                                            <div class="f_column">
                                                <label></label>
                                                <input type="hidden" class="f_txt">
                                            </div>
                                            <div class="f_column">
                                                <label>Repita la contraseña</label>
                                                <input type="password" name="passw2" id="passw2" class="f_txt" placeholder="Contraseña">
                                                <i class="fas fa-eye-slash show-passw" id="showPassw2" onclick="showPassword(this, document.getElementById('passw2'))"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn_group">
                                        <a href="#" class="btn prev-btn">Anterior</a>
                                        <a href="#" class="btn next-btn">Siguiente</a>
                                    </div>
                                </div>
                                <div class="form-step">
                                    <div class="input_group">
                                        <div class="f_row">
                                            <div class="f_column">
                                                <label>Seleccione el motivo(obligatorio)</label>
                                                <select name="motivo" class="f_txt esp" required>
                                                    <option></option>
                                                    <option>Malestar</option>
                                                    <option>Revision</option>
                                                </select>
                                            </div>
                                            <div class="f_column">
                                                <label>Seleccione el servicio(obligatorio)</label>
                                                <select name="servicio" class="f_txt esp" required>
                                                    <option></option>
                                                    <option>Consulta</option>
                                                    <option>Ecografia</option>
                                                    <option>Odontologia</option>
                                                    <option>Genicologia</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="input_group">
                                        <div class="f_row">
                                            <div class="f_column">
                                                <label>Detalles de la cita o notas adicionales</label>
                                                <textarea class="f_txt" name="notas" placeholder="Escribe los detalles aqui..."></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="btn_group">
                                        <a href="#" class="btn prev-btn">Anterior</a>
                                        <a href="#" class="btn next-btn">Siguiente</a>

                                    </div>
                                </div>
                                <div class="form-step">

                                    <div class="btn_group">
                                        <a href="#" class="btn prev-btn">Anterior</a>
                                        <input type="submit" name="accion" class="btn" style="background-color: #04AA6D" value="Guardar">

                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>
            <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
            <script src="<%= request.getContextPath()%>/recursos/js/jquery-ui.min.js"></script>
            <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
            <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js"></script>
            <script src="<%= request.getContextPath()%>/recursos/js/mod_cita.js" ></script>
            <script src="<%= request.getContextPath()%>/datatable/buttons.dataTables.min.js"></script>
            <script src="<%= request.getContextPath()%>/datatable/datatables.min.js"></script>
            <script src="<%= request.getContextPath()%>/datatable/pdfmake.min.js"></script>
            <script src="<%= request.getContextPath()%>/datatable/vfs_fonts.js"></script>
            <script src="<%= request.getContextPath()%>/datatable/jszip.min.js"></script>
    </body>

</html>
