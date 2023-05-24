<%@page import="modelo.Sanitario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil de usuario</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/perfil.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
    </head>
    <body>
        <% Sanitario usu = (Sanitario) session.getAttribute("usuario");%>
        <%@include file="no_session.jsp"%>



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
                    <%                        if (usu != null) {
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

                    <li><a href="Controlador?menu=Perfil&accion=perfil" class="link-active" title="Mi perfil">
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
                        <div class="imgcontainer">
                            <img src="<%= request.getContextPath()%>/recursos/img/4.jpg" alt="Perfil" class="img-perfil">
                            <span class="edit-img"><i class="fas fa-pen"></i></span>
                            <h3>Mi perfil</h3>
                            <button type="button" onclick="editarPerfil()" class="edit-btn">Editar perfil</button>
                        </div>
                        <form action="actualizaperfilsanitario?accion=mperfil" method="post" class="form-container" onsubmit="return checkPassword()">

                            <fieldset>
                                <legend>Datos personales para el personal sanitario</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Nombre</label>
                                        <input type="text" id="nom" name="nombre" class="f_txt" value="${usuario.getNombre()}" disabled="true">
                                    </div>
                                    <div class="f_column">
                                        <label>Sexo</label>
                                        <div class="f_txt">
                                            <label><input type="radio" name="sexo" value="hombre"> Hombre</label>
                                            <label><input type="radio" name="sexo" value="mujer"> Mujer</label>
                                            <label><input type="radio" name="sexo" value="no binario"> No binario</label>
                                        </div>

                                    </div>
                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Nacionalidad</label>
                                        <select class="f_txt" id="nacion" name="nacion" disabled="true">
                                            <option>${usuario.getNacion()}</option>
                                            <option>Ecuatoguineano</option>
                                            <option>Nacionalidad 2</option>
                                            <option>Nacionalidad 3</option>
                                        </select>
                                    </div>
                                    <div class="f_column">
                                        <label>Dip/passaporte</label>
                                        <input type="text" name="documento" id="doc" class="f_txt" value="${usuario.getDocumento()}" readonly>
                                    </div>
                                </div>

                            </fieldset>

                            <fieldset>
                                <legend>Especialidad</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Seleccione la especialidad</label>
                                        <select class="f_txt esp" name="espe" disabled="">
                                            <option>${usuario.getEspecialidad()}</option>
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
                                <legend>Direccion y contacto</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Direccion</label>
                                        <input type="text" id="dir" name="dir" class="f_txt" value="${usuario.getDireccion()}" disabled="true">
                                    </div>
                                    <div class="f_column">
                                        <label>Telefono</label>
                                        <input type="text" id="tel" name="tel" class="f_txt" value="${usuario.getTelefono()}" disabled="true">
                                    </div>
                                    <div class="f_column">
                                        <label>Email</label>
                                        <input type="email" id="email" name="email" class="f_txt" value="${usuario.getEmail()}" disabled="true">
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset>
                                <legend>Datos de usuario</legend>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label>Usuario</label>
                                        <input type="text" name="user" id="user" class="f_txt" value="${usuario.getUsuario()}" disabled="true">
                                    </div>
                                    <div class="f_column">
                                        <label>Contraseña</label>
                                        <input type="password" name="psw" id="passw" class="f_txt" value="${usuario.getContrasena()}" disabled="true">
                                    </div>
                                    <div class="f_column">
                                        <label>Repita la contraseña</label>
                                        <input type="password" name="psw2" id="passw2" class="f_txt" value="${usuario.getContrasena()}" disabled="true">
                                    </div>
                                </div>
                                <label><input type="checkbox" onclick="showPassword()"> Mostrar contraseña</label>
                            </fieldset>

                            <div class="f_row">
                                <button type="submit" name="accion" id="btnGuardar" style="display: none" class="btn_guardar">Guardar</button>
                            </div>

                        </form>

                    </div>
                </div>


            </div>

        </div>

        <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js"></script>
        <!--<script src="<%= request.getContextPath()%>/recursos/js/mod_hc.js" type="text/javascript"></script>-->

    </body>
</html>