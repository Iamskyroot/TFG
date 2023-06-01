<%@page import="modelo.Sanitario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pacientes</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
    <link href="<%=request.getContextPath()%>/datatable/buttons.dataTables.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/datatable/datatables.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
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
                    <a href="#" class="myBtn" data-toggle="collapse" data-target="#my-sub" title="Citas" aria-expanded="false">
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
                    <%}
                        }%>
                <li><a href="Controlador?menu=Pacientes&accion=Listar&page=1" class="link-active" title="Pacientes">
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
                        <div id="export" class="filter_div"></div>

                        <div class="search_div" id="search">

                            <input type="search" name="txtBuscar" id="txt" class="inp_search" placeholder="Buscar paciente"
                                   onkeyup="buscarPaciente(this.value)" autofocus>
                            <button type="button" class="btn_search" onclick="buscarPaciente(document.getElementById('txt').value)"><i class="fas fa-search"></i></button>

                        </div>
                    </div>
                    <div class="table-responsive">

                        <table class="table table-striped table-hover" id="tab">
                            <thead>
                                <tr>

                                    <th>Nombre</th>
                                    <th>edad</th>
                                    <th>sexo</th>
                                    <th>documento</th>
                                    <th>direccion</th>
                                    <th>telefono</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="res">
                                <c:forEach  items="${p}" var="p">
                                    <tr>
                                        <td>${p.getNombre()}</td>
                                        <td>${p.getEdad()}</td>
                                        <td>${p.getSexo()}</td>
                                        <td>${p.getDocumento()}</td>
                                        <td>${p.getDireccion()}</td>
                                        <td>${p.getTelefono()}</td>
                                        <td class="btn-group-sm">
                                            <a class="btn btn-success" href="#" onclick="openFormEdit(${p.getCodigo()}, '${p.getNombre()}',${p.getEdad()}, '${p.getSexo()}', '${p.getDocumento()}', '${p.getDireccion()}', '${p.getTelefono()}', '${p.getUsuario()}', '${p.getContrasena()}')"  title="Editar"><i class="far fa-edit"></i></a>
                                                <%
                                                    if (!usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {

                                                %>
                                            <a class="btn btn-warning" href="#" onclick="openConsulta(${p.getCodigo()}, '${p.getNombre()}')" title="Nueva consulta"><i class="fas fa-plus"></i></a>
                                                <%}%>
                                        </td>
<!--                                        <td><a style="color: green" href="#" onclick="openFormEdit(${p.getCodigo()},'${p.getNombre()}',${p.getEdad()},'${p.getSexo()}','${p.getDocumento()}','${p.getDireccion()}','${p.getTelefono()}','${p.getUsuario()}','${p.getContrasena()}')"  title="Editar"><i class="far fa-edit"></i></a></td>
                                        <td><a href="#" onclick="openConsulta(${p.getCodigo()}, '${p.getNombre()}')" title="Nueva consulta"><i  class="far fa-plus-square"></i></a></td>-->
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>


                        <div class="paginacion">
                            <!--display previous link except for the first page-->
                            <c:if test="${pagActual != 1}">
                                <a href="Controlador?menu=Pacientes&accion=Listar&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                                </c:if>
                            <!--displaying page numbers-->
                            <c:forEach begin="1" end="${noPag}" var="i">
                                <c:choose>
                                    <c:when test="${pagActual eq i}">
                                        <a href="Controlador?menu=Pacientes&accion=Listar&page=${i}" class="active">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="Controlador?menu=Pacientes&accion=Listar&page=${i}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <!--display previous link except for the first page-->
                            <c:if test="${pagActual lt noPag}">
                                <a href="Controlador?menu=Pacientes&accion=Listar&page=${pagActual + 1}"><i class="fas fa-angle-double-right"></i></a>
                                </c:if>

                        </div>
                        <label style="float: right;font-weight: bold;margin-right: 150px">Total: ${noFilas}</label>
                    </div>

                </div>

                <!-- Add and popup forms -->
                <button class="open-button" onclick="openForm(document.getElementById('registro'))" title="Añadir un nuevo paciente"><i class="fas fa-plus"></i></button>
                <div class="modal" id="registro">

                    <div class="form-popup animate">
                        <form action="paciente" method="post" class="form-container" autocomplete="off">
                            <h2>Formulario de registro de pacientes</h2>
                            <fieldset>
                                <legend>Datos personales</legend>
                                <div class="f_row" id="extraInput">
                                    <div class="f_column">
                                        <label>Id</label>
                                        <input type="number" name="idPaci" id="idPaci" class="f_txt" readonly>
                                    </div>
                                    <div class="f_column">
                                        <label></label>
                                        <input type="hidden" class="f_txt">
                                    </div>
                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Nombre</label>
                                        <input type="text" name="nombre" id="nombre" class="f_txt" placeholder="Nombre completo" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Edad</label>
                                        <input type="number" name="edad" id="edad" min="1" class="f_txt" placeholder="edad" required>
                                    </div>

                                </div>
                                <div class="f_row">

                                    <div class="f_column">
                                        <label>Sexo</label>
                                        <select name="sexo" id="sexo" class="f_txt esp" required>
                                            <option></option>
                                            <option>Hombre</option>
                                            <option>Mujer</option>
                                        </select>
                                    </div>

                                    <div class="f_column">
                                        <label>Documento</label>
                                        <input type="text" name="doc" id="doc" class="f_txt" placeholder="Nº DIP o pasaporte">
                                    </div>
                                </div>
                                <div class="f_row">

                                    <div class="f_column">
                                        <label>Direccion</label>
                                        <input type="text" name="dir" id="dir" class="f_txt" placeholder="Direccion" required>
                                    </div>

                                    <div class="f_column">
                                        <label>Telefono</label>
                                        <input type="text" name="tel" id="tel" class="f_txt" placeholder="Telefono">
                                    </div>
                                </div>

                            </fieldset>

                            <fieldset>
                                <legend>Datos de usuario</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Usuario</label>
                                        <input type="text" name="user" id="user" class="f_txt" placeholder="Nombre de usuario">
                                    </div>
                                    <div class="f_column">
                                        <label>Contraseña</label>
                                        <input type="password" name="psw" id="passw" class="f_txt" placeholder="Contraseña">
                                        <!--<i class="fas fa-eye-slash show-passw" id="showPassw" onclick="showPassword(this, document.getElementById('passw'))"></i>-->
                                    </div>
                                </div>

                                <div class="f_row">
                                    <div class="f_column">
                                        <label></label>
                                        <input type="hidden" class="f_txt">
                                    </div>
                                    <div class="f_column">
                                        <label>Repita la contraseña</label>
                                        <input type="password" name="psw2" id="passw2" class="f_txt" placeholder="Contraseña">
                                        <!--<i class="fas fa-eye-slash show-passw" id="showPassw" onclick="showPassword(this, document.getElementById('passw2'))"></i>-->
                                    </div>
                                </div>
                                <label><input type="checkbox" onclick="showPassword()"> Mostrar contraseña</label>
                            </fieldset>

                            <div class="f_row">
                                <input type="submit" name="accion" class="btn_guardar" value="Guardar"/>
                                <input type="submit" name="accion" id="actualizarPaciente" class="btn_guardar" style="background-color: #04AA6D" value="Actualizar"/>
                            </div>

                        </form>
                        <span class="cancel" onclick="closeForm(document.getElementById('registro'))" title="Cerrar el formulario">&times;</span>
                    </div>

                </div>


                <div class="modal" id="registroConsulta">
                    <div class="sugerencias" id="sug">
                        <label class="titulo">Sugerencias de pruebas</label>
                        <ul>
                            <li>Sugerencia #1</li>
                            <li>Sugerencia #2</li>
                            <li>Sugerencia #3</li>
                        </ul>
                    </div>
                    <div class="form-popup animate">
                        <form action="consulta" method="post" class="form-container" autocomplete="off">
                            <h2>Formulario de consulta</h2>
                            <fieldset class="seccion_form">
                                <legend>Datos de la consulta</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Codigo</label>
                                        <input type="text" name="id" id="idPaciente" class="f_txt" placeholder="Id paciente" readonly>
                                    </div>
                                    <div class="f_column" >
                                        <label>Nombre</label>
                                        <input type="text" name="nombre" id="nom" value="" class="f_txt" placeholder="Id paciente" readonly>
                                    </div>
                                    <div class="f_column">
                                        <label>Motivo</label>
                                        <select name="motivo" id="motivo" class="f_txt" required>
                                            <option value="Malestar">Malestar</option>
                                            <option value="Revision">Revision medica</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Altura(en cm)</label>
                                        <input type="text" name="altura" class="f_txt" min="40" max="240" placeholder="altura" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Peso(en Kg)</label>
                                        <input type="text" name="peso" class="f_txt" min="1" max="250" placeholder="Peso" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Temperatura(en ºC)</label>
                                        <input type="text" name="temperatura" class="f_txt" min="20" max="100" placeholder="Temperatura" required>
                                    </div>
                                </div>
                                <div class="f_row" id="sintomas">
                                    <div class="f_column">
                                        <label><b>Sintomas comunes</b></label>
                                        <ul style="list-style: none" class="f_txt">
                                            <li><label for="f"><input type="checkbox" id="f" class="s" name="s" value="fiebre"> Fiebre</label></li>
                                            <li><label for="dc"><input type="checkbox" id="dc" class="s" name="s" value="dolor de cabeza"> Dolor de cabeza</label></li>
                                            <li><label for="v"><input type="checkbox" id="v" class="s" name="s" value="vomitos"> Vómitos</label></li>
                                            <li><label for="diar"><input type="checkbox" id="diar" class="s" name="s" value="diarrea"> Dierrea</label></li>
                                            <li><label for="deb"><input type="checkbox" id="deb" class="s" name="s" value="debilidad corporal"> Debilidad corporal</label></li>
                                        </ul>
                                    </div>
                                    <div class="f_column">
                                        <label>Otros sintomas</label>
                                        <textarea class="textarea" class="f_txt" name="sintomas" placeholder="Escribe aqui..."></textarea>
                                    </div>
                                </div>


                                <p class="acordeon" id="acordeon">Observaciones y notas adicionales</p>
                                <div class="panel" id="panel">
                                    <div>

                                        <textarea class="textarea" class="f_txt" name="notas" placeholder="escribe las observaciones aqui..."></textarea>

                                    </div>

                                </div>
                                <p class="acordeon" id="acordeon">Pruebas a realizar</p>
                                <div class="panel" id="panel">
                                    <!--                                <div>
                                    
                                                                        <textarea class="textarea" name="pruebas" placeholder="Escribe las pruebas aqui..."></textarea>
                                                                    </div>-->
                                    <input type="text" id="txtBuscar" class="f_txt" onkeyup="filtrarLista()" placeholder="Buscar enfermedad.." title="Escriba una enfermedad">

                                    <ul id="listaTrata" class="lista">

                                        <%@include file="listarpuebas.jsp" %>
                                    </ul>
                                </div>
                            </fieldset>

                            <div class="f_row">
                                <input type="submit" class="btn_guardar" name="accion" value="Guardar consulta">  
                            </div>

                        </form>
                        <span class="cancel" onclick="closeForm(document.getElementById('registroConsulta'))" title="Cerrar el formulario">&times;</span>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath()%>/recursos/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath()%>/recursos/js/mod_interconsulta.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath()%>/datatable/buttons.dataTables.min.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/datatables.min.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/pdfmake.min.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/vfs_fonts.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/jszip.min.js"></script>

</body>
</html>