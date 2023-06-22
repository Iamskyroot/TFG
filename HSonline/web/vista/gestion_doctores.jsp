<%-- 
    Document   : gestion_doctores
    Created on : 23-dic-2022, 13:17:54
    Author     : Skyroot
--%>

<%@page import="modelo.Sanitario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Personal sanitario</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/recursos/css/doctores.css">
        <link href="<%=request.getContextPath()%>/assets/css/all.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% Sanitario usu = (Sanitario) session.getAttribute("usuario");%>

        <%@include file="no_session.jsp"%>

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
                    <%                        if (usu != null) {
                            if (usu.getEspecialidad().equalsIgnoreCase("admin") && (!usu.getEspecialidad().equalsIgnoreCase("enfermeria") || usu.getEspecialidad().equalsIgnoreCase("recepcionista"))) {
                    %>
                    <li><a href="CtrlDoctores?menu=Doctores&accion=Listar&page=1" class="link-active" title="Personal sanitario">
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
                                if (usu.getEspecialidad().equalsIgnoreCase("admin") && (!usu.getEspecialidad().equalsIgnoreCase("recepcionista"))) {
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
                    <li><a href="Horario?menu=Horario&accion=Listar&page=1" id="horario" title="Horarios">
                            <span class="icon"><i class="fas fa-calendar-week"></i></span>
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
                        <%
                                }
                            }
                        %>
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

                            <div class="search_div">
                                <input type="search" name="txtBuscar" id="txt" onkeyup="buscarPersonal(this.value)" class="inp_search" placeholder="Buscar muestra" autofocus>
                                <!--<input type="submit" name="" class="btn_search" value="Buscar">-->
                                <button type="button" onclick="buscarPersonal(document.getElementById('txt')).value" class="btn_search"><i class="fas fa-search"></i></button>
                                <!--                                <form action="RegistrarConsulta?accion=Buscar" method="post">
                                                                </form>-->
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <td>ID</td>
                                        <td>Nombre</td>
                                        <td>Documento</td>
                                        <td>Especialidad</td>
                                        <td>Telefono</td>
                                        <td>Acciones</td>
                                    </tr>
                                </thead>
                                <tbody id="res">
                                    <c:forEach  items="${datos}" var="datos">
                                        <tr>
                                            <td>${datos.getCodigo()}</td>
                                            <td>${datos.getNombre()}</td>
                                            <td>${datos.getDocumento()}</td>
                                            <td>${datos.getEspecialidad()}</td>
                                            <td>${datos.getTelefono()}</td>
                                            <td class="btn-group-sm">
                                                <a class="btn btn-success" href="#" onclick="horarioPersonal(${datos.getCodigo()})" title="Asignar horario"><i class="far fa-calendar"></i></a>
                                                <a class="btn btn-danger" href="#" onclick="eliminarPersonal(${datos.getCodigo()},'${datos.getNombre()}')" title="Eliminar"><i class="far fa-trash-alt"></i></a>
                                                <a class="btn btn-info" href="CtrlDoctores?menu=Doctores&accion=Detalle&id=${datos.getCodigo()}" title="Mostrar detalles"><i class="far fa-eye"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="paginacion">
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual != 1}">
                                    <a href="CtrlDoctores?menu=Doctores&accion=listar&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                                    </c:if>
                                <!--displaying page numbers-->
                                <c:forEach begin="1" end="${noPag}" var="i">
                                    <c:choose>
                                        <c:when test="${pagActual eq i}">
                                            <a href="CtrlDoctores?menu=Doctores&accion=listar&page=${i}" class="active">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="CtrlDoctores?menu=Doctores&accion=listar&page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <!--display previous link except for the first page-->
                                <c:if test="${pagActual lt noPag}">
                                    <a href="CtrlDoctores?menu=Doctores&accion=listar&page=${pageActual - 1}"><i class="fas fa-angle-double-right"></i></a>
                                    </c:if>

                            </div>
                            <label style="float: right;font-weight: bold">Total: ${noFilas}</label>

                        </div>

                    </div>

                    <!-- Add and popup form -->
                    <div class="open-button" onclick="openForm()" title="Añadir un nuevo personal"><i class="fas fa-plus"></i></div>

                    <div class="modal" id="modal">

                        <div class="form-popup animate">
                            <form action="sanitario?accion=registro" method="post" onsubmit="return validateFormRegistro()" class="form-container" autocomplete="off">
                                <h2>Registro de personal sanitario</h2>
                                <fieldset>
                                    <legend>Datos personales para el personal sanitario</legend>
                                    <div class="f_row">
                                        <div class="f_column">
                                            <label>Nombre</label>
                                            <input type="text" name="nombre" class="f_txt req" placeholder="Nombre completo">
                                        </div>
                                        <div class="f_column">
                                            <label>Sexo</label>
                                            <div class="f_txt">
                                                <label><input type="radio" value="hombre" name="sexo"> Hombre</label>
                                                <label><input type="radio" value="mujer" name="sexo"> Mujer</label>
                                                <label><input type="radio" value="nobinario" name="sexo"> No binario</label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="f_row">
                                        <div class="f_column">
                                            <label>Nacionalidad</label>
                                            <select class="f_txt req" name="nacion">
                                                <option value="">--Seleccionar--</option>
                                                <option>Ecuatoguineano</option>
                                                <option>Nacionalidad 2</option>
                                                <option>Nacionalidad 3</option>
                                            </select>
                                        </div>
                                        <div class="f_column">
                                            <label>Dip/passaporte</label>
                                            <input type="text" name="doc" class="f_txt req" placeholder="Nº DIP o pasaporte">
                                        </div>
                                    </div>

                                </fieldset>

                                <fieldset>
                                    <legend>Direccion y contacto</legend>
                                    <div class="f_row">
                                        <div class="f_column">
                                            <label>Direccion</label>
                                            <input type="text" name="dir" class="f_txt req" placeholder="Nombre barrio y zona">
                                        </div>
                                        <div class="f_column">
                                            <label>Telefono</label>
                                            <input type="text" name="tel" class="f_txt req" placeholder="telefono">
                                        </div>
                                        <div class="f_column">
                                            <label>Email</label>
                                            <input type="email" name="email" class="f_txt" placeholder="Email">
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset>
                                    <legend>Especialidad</legend>
                                    <div class="f_row">
                                        <div class="f_column">
                                            <label>Seleccione la especialidad</label>
                                            <select class="f_txt esp req" name="espe">
                                                <option value="">--Seleccionar--</option>
                                                <option>Medicina general</option>
                                                <option>Laboratorio</option>
                                                <option>Enfermeria</option>
                                                <option>Odontologia</option>
                                                <option>Genicologia</option>
                                                <option>Cirugia</option>
                                                <option>Pediatria</option>
                                                <option>Maternidad</option>
                                            </select>
                                        </div>

                                    </div>

                                </fieldset>

                                <fieldset>
                                    <legend>Datos de usuario</legend>
                                    <div class="f_row">
                                        <div class="f_column">
                                            <label>Usuario</label>
                                            <input type="text" name="user" id="user" class="f_txt req">
                                        </div>
                                        <div class="f_column">
                                            <label>Contraseña</label>
                                            <input type="password" name="passw" id="passw" class="f_txt req">
                                        </div>
                                        <div class="f_column">
                                            <label>Repita la contraseña</label>
                                            <input type="password" name="psw2" id="passw2" class="f_txt">
                                        </div>
                                    </div>
                                    <label><input type="checkbox" onclick="showPassword()"> Mostrar contraseña</label>
                                </fieldset>

                                <div class="f_row">
                                    <button type="submit" class="btn_guardar">Guardar</button>
                                </div>

                                <span class="cancel" onclick="closeForm(document.getElementById('modal'))" title="Cerrar el formulario">&times;</span>
                            </form>
                        </div>

                    </div>


                    <div class="modal" id="modalHorario">

                        <div class="form-popup animate">
                            <form action="sanitario?accion=horario" method="post" class="form-container">
                                <h2>Asignar horario</h2>

                                <div class="f_row">
                                    <div class="f_column">
                                        <label>ID</label>
                                        <input type="number" name="idSan" id="idSan" class="f_txt" readonly required>
                                    </div>
                                    <div class="f_column">
                                        <label>Dia de la semana</label>
                                        <select class="f_txt" name="dia" required>
                                            <option value=""></option>
                                            <option value="lunes">Lunes</option>
                                            <option value="martes">Martes</option>
                                            <option value="miercoles">Miercoles</option>
                                            <option value="jueves">Jueves</option>
                                            <option value="viernes">Viernes</option>
                                            <option value="sabado">Sabado</option>
                                            <option value="domingo">Domingo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Hora de entrada</label>
                                        <input type="time" class="f_txt" name="inicio" required>
                                    </div>
                                    <div class="f_column">
                                        <label>Hora de salida</label>
                                        <input type="time" class="f_txt" name="fin" required>
                                    </div>
                                </div>
                                

                                <div class="f_row">
                                    <button type="submit" name="accion" class="btn_guardar">Guardar</button>
                                </div>

                                <span class="cancel" onclick="closeForm(document.getElementById('modalHorario'))" title="Cerrar el formulario">&times;</span>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script src="<%= request.getContextPath()%>/recursos/js/index.global.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/mod_doctor.js"></script>

    </body>
</html>