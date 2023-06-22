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
    <link href="<%=request.getContextPath()%>/datatable/dataTables.bootstrap5.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/all.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/estilos_resultados.css"/>
    <link href="<%=request.getContextPath()%>/recursos/css/registropaciente.css" rel="stylesheet" type="text/css"/>
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

                                    <th>ID</th>
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
                                        <td>${p.getCodigo()}</td>
                                        <td>${p.getNombre()}</td>
                                        <td>${p.getEdad()}</td>
                                        <td>${p.getSexo()}</td>
                                        <td>${p.getDocumento()}</td>
                                        <td>${p.getDireccion()}</td>
                                        <td>${p.getTelefono()}</td>
                                        <td class="btn-group-sm">
                                            <a class="btn btn-success" href="#" onclick="openFormEdit(${p.getCodigo()}, '${p.getNombre()}',${p.getEdad()}, '${p.getSexo()}', '${p.getDocumento()}', '${p.getDireccion()}', '${p.getTelefono()}', '${p.getUsuario()}', '${p.getContrasena()}')"  title="Editar"><i class="far fa-edit"></i></a>
                                                <%
                                                    if (usu != null)
                                                        if (!usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {

                                                %>
                                            <a class="btn btn-warning" href="#" onclick="openConsulta(document.getElementById('registroTriaje'), ${p.getCodigo()}, document.getElementById('idTria'))" title="Nuevo triaje"><i class="fas fa-plus"></i></a>
                                                <%                                                    if (!usu.getEspecialidad().equalsIgnoreCase("enfermeria")) {
                                                %>
                                            <a class="btn btn-warning btn-consulta" style="background-color: greenyellow" href="#" onclick="openConsulta(document.getElementById('registroConsulta'), ${p.getCodigo()}, document.getElementById('idCon'))" title="Nueva consulta"><i class="fas fa-stethoscope"></i></a>
                                                <%}
                                                        }%>
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
                        <label style="float: right;font-weight: bold">Total: ${noFilas}</label>
                    </div>

                </div>

                <!-- Add and popup forms -->
                <button class="open-button" onclick="openForm(document.getElementById('registro'))" title="Añadir un nuevo paciente"><i class="fas fa-plus"></i></button>
                <div class="modal" id="registro">

                    <div class="form-popup animate">
                        <form action="paciente" id="form" method="post" class="form-container" autocomplete="off">
                            <h2>Formulario de registro de pacientes</h2>
                            <fieldset>
                                <legend>Datos personales</legend>
                                <div id="extraInput">
                                    <label>ID: <input type="number" name="idPaci" id="idPaci" readonly style="outline: none;border: none"></label>
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
                            <div style="overflow: auto">
                                <div class="f_row">
                                <input type="submit" name="accion" id="btnGuardar" class="btn_guardar" value="Guardar"/>
                                <input type="submit" name="accion" id="actualizarPaciente" class="btn_guardar" value="Actualizar"/>
                            </div>
                            </div>

                        </form>
                        <span class="cancel" onclick="closeForm(document.getElementById('registro'))" title="Cerrar el formulario">&times;</span>
                    </div>

                </div>

<!--                <div class="modal" id="registro">

                    <div class="form-popup animate">
                        <form action="paciente" method="post" class="form-container" id='regForm' autocomplete="off">
                            <h2>Formulario de registro de pacientes</h2>

                             Progress 
                            <div class="progressbar">
                                <div class="progress" id="progress"></div>
                                <div class="progress-step progress-step-active" data-title="Datos personales"></div>
                                <div class="progress-step" data-title="Constantes vitales"></div>
                            </div>
                            <div class="form-step form-step-active">

                                <div class="f_row">
                                    <div class="f_column">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" name="nombre" id="nombre" class="f_txt req" autofocus placeholder="Nombre completo" required>
                                    </div>
                                    <div class="f_column">
                                        <label for="edad">Edad</label>
                                        <input type="number" name="edad" id="edad" min="1" class="f_txt req" placeholder="edad" required>
                                    </div>

                                </div>
                                <div class="f_row">

                                    <div class="f_column">
                                        <label for="sexo">Sexo</label>
                                        <select name="sexo" id="sexo" class="f_txt esp req">
                                            <option></option>
                                            <option>Hombre</option>
                                            <option>Mujer</option>
                                        </select>
                                    </div>

                                    <div class="f_column">
                                        <label for="doc">Documento</label>
                                        <input type="text" name="doc" id="doc" class="f_txt req" placeholder="Nº DIP o pasaporte">
                                    </div>
                                </div>
                                <div class="f_row">

                                    <div class="f_column">
                                        <label for="dir">Direccion</label>
                                        <input type="text" name="dir" id="dir" class="f_txt req" placeholder="Direccion" required>
                                    </div>

                                    <div class="f_column">
                                        <label for="tel">Telefono</label>
                                        <input type="text" name="tel" id="tel" class="f_txt" placeholder="Telefono">
                                    </div>
                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label for="user">Usuario</label>
                                        <input type="text" name="user" id="user" class="f_txt req" placeholder="Nombre de usuario">
                                    </div>
                                    <div class="f_column">
                                        <label for="passw">Contraseña</label>
                                        <input type="password" name="psw" id="passw" class="f_txt req" placeholder="Contraseña">
                                    </div>
                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label></label>
                                        <input type="hidden" class="f_txt">
                                    </div>
                                    <div class="f_column">
                                        <label for="passw2">Repita la contraseña</label>
                                        <input type="password" name="psw2" id="passw2" class="f_txt" placeholder="Contraseña">
                                    </div>
                                </div>
                                <label><input type="checkbox" onclick="showPassword()"> Mostrar contraseña</label>
                            </div>
                            step 2
                            <div class="form-step">
                                <div class="f_row">
                                    <div class="f_column">
                                        <label for="motivo">Motivo</label>
                                        <select name="motivo" id="motivo" class="f_txt" required>
                                            <option value="Malestar">Malestar</option>
                                            <option value="Revision">Revision medica</option>
                                        </select>
                                    </div>
                                    <div class="f_column">
                                        <label for="altura">Altura(en cm)</label>
                                        <input type="text" name="altura" id="altura" class="f_txt" min="40" max="240" placeholder="altura">
                                    </div>

                                    <div class="f_column">
                                        <label for="peso">Peso(en Kg)</label>
                                        <input type="text" name="peso" id="peso" class="f_txt req" min="1" max="250" placeholder="Peso">
                                    </div>

                                </div>
                                <div class="f_row">
                                    <div class="f_column">
                                        <label for="temp">Temperatura(en ºC)</label>
                                        <input type="text" name="temperatura" id="temp" class="f_txt req" min="20" max="100" placeholder="Temperatura">
                                    </div>
                                    <div class="f_column">
                                        <label for="tension">Tensión arterial</label>
                                        <input type="text" name="tension" id="tension" class="f_txt" min="20" max="100" placeholder="tension arterial">
                                    </div>
                                    <div class="f_column">
                                        <label for="pulso">Frecuencia cardiaca</label>
                                        <input type="text" name="pulso" id="pulso" class="f_txt" min="20" max="100" placeholder="pulso" required>
                                    </div>
                                </div>
                                <div class="f_row" id="sintomas">
                                    <div class="f_column">
                                        <label><b>Sintomas comunes</b></label>
                                        <ul style="list-style: none" class="f_txt">
                                            <li><label for="f1"><input type="checkbox" id="f1" class="s" name="s" value="fiebre"> Fiebre</label></li>
                                            <li><label for="dc1"><input type="checkbox" id="dc1" class="s" name="s" value="dolor de cabeza"> Dolor de cabeza</label></li>
                                            <li><label for="v1"><input type="checkbox" id="v1" class="s" name="s" value="vomitos"> Vómitos</label></li>
                                            <li><label for="diar1"><input type="checkbox" id="diar1" class="s" name="s" value="diarrea"> Dierrea</label></li>
                                            <li><label for="deb1"><input type="checkbox" id="deb1" class="s" name="s" value="debilidad corporal"> Debilidad corporal</label></li>
                                        </ul>
                                    </div>
                                    <div class="f_column">
                                        <label>Otros sintomas</label>
                                        <textarea class="textarea" class="f_txt" name="sintomas" placeholder="Escribe aqui..."></textarea>
                                        <select class="f_txt" name="servicio">
                                            <option value="">--Seleccione el servicio--</option>
                                            <option>Cardiología</option>
                                            <option>Cuidados intensivos</option>
                                            <option>Consulta externa</option>
                                            <option>Cirugía general</option>
                                            <option>Cirugía ortopédica y traumatología</option>
                                            <option>Dermatología</option>
                                            <option>Digestivo</option>
                                            <option>Genicología y Obstetricia</option>
                                            <option>Hematología</option>
                                            <option>Medicina general</option>
                                            <option>Nefrología</option>
                                            <option>Neumología</option>
                                            <option>Oncologia</option>
                                            <option>Odontología</option>
                                            <option>Oftalmología</option>
                                            <option>Pediatría</option>
                                            <option>Reabilitacion</option>
                                            <option>Radiologia</option>
                                            <option>Urgencias</option>
                                            <option>Urología</option> 
                                        </select>
                                    </div>

                                    <div class="f_column">
                                        <label><b>Clasificacion</b></label>
                                        <ul style="list-style: none" class="f_txt">
                                            <li><label for="1" title="Atención inmediata requerida"><input type="radio" id="1" class="s" name="estado" value="1"> EMERGENCIA</label></li>
                                            <li><label for="2" title="Hasta 15 minutos máximo de espera"><input type="radio" id="2" class="s" name="estado" value="2"> URGENCIA</label></li>
                                            <li><label for="3" title="Hasta 30 minutos máximo de espera"><input type="radio" id="3" class="s" name="estado" value="3"> URGENCIA MENOR</label></li>
                                            <li><label for="4" title="Hasta 60 minutos máximo de espera"><input type="radio" id="4" class="s" name="estado" value="4"> CONSULTA RUTINARIA</label></li>
                                            <li><label for="5" title="Hasta 120 minutos máximo de espera"><input type="radio" id="5" class="s" name="estado" value="5"> NO PRIORITARIO</label></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>


                                                        <div class="f_row">
                                                            <input type="submit" name="accion" class="btn_guardar" value="Guardar"/>
                                                            <input type="submit" name="accion" id="actualizarPaciente" class="btn_guardar" style="background-color: #04AA6D" value="Actualizar"/>
                                                        </div>

                            <div style="overflow:auto;">
                                <div style="float:right;">
                                    <button type="button" id="prevBtn" onclick="nextPrev(-1)">Atrás</button>
                                    <button type="button" name="accion" id="nextBtn" onclick="nextPrev(1)">Siguiente</button>
                                </div>
                            </div>

                        </form>
                        <span class="cancel" onclick="closeForm(document.getElementById('registro'))" title="Cerrar el formulario">&times;</span>
                    </div>

                </div>-->




                <div class="modal" id="registroTriaje">
                    <div class="form-popup animate">
                        <form action="consulta" method="post" class="form-container" onsubmit="return validateTriaje()" autocomplete="off">
                            <h2>Formulario de consulta</h2>
                            <label>ID: <input type="text" name="id" id="idTria" style="border: none;outline: none" readonly></label>
                            <div class="f_row">
                                <div class="f_column">
                                    <label for="motivo">Motivo</label>
                                    <select name="motivo" id="motivo" class="f_txt" required>
                                        <option value="Malestar">Malestar</option>
                                        <option value="Revision">Revision medica</option>
                                    </select>
                                </div>
                                <div class="f_column">
                                    <label for="altura">Altura(en cm)</label>
                                    <input type="number" name="altura" id="altura" class="f_txt req" min="40" max="240" step="0.01" placeholder="altura">
                                </div>

                                <div class="f_column">
                                    <label for="peso">Peso(en Kg)</label>
                                    <input type="number" name="peso" id="peso" class="f_txt req" min="1" max="250" step="0.01" placeholder="Peso">
                                </div>

                            </div>
                            <div class="f_row">
                                <div class="f_column">
                                    <label for="temp">Temperatura(en ºC)</label>
                                    <input type="number" name="temperatura" id="temp" class="f_txt req" min="20" max="100" step="0.01" placeholder="Temperatura">
                                </div>
                                <div class="f_column">
                                    <label for="tension">Tensión arterial</label>
                                    <input type="number" name="tension" id="tension" class="f_txt" step="0.01" placeholder="tension arterial">
                                </div>
                                <div class="f_column">
                                    <label for="pulso">Frecuencia cardiaca</label>
                                    <input type="number" name="pulso" id="pulso" class="f_txt" step="0.01" placeholder="pulso">
                                </div>
                            </div>
                            <div class="f_row">

                                <div class="f_row" id="sintomas">
                                    <div class="f_column" id="s">
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
                                        <textarea class="f_txt textarea s" name="sintomas" id="sin" placeholder="Escribe aqui..."></textarea>
                                        <select class="f_txt req" name="servicio">
                                            <option value="">--Seleccione el servicio--</option>
                                            <option>Cardiología</option>
                                            <option>Cuidados intensivos</option>
                                            <option>Consulta externa</option>
                                            <option>Cirugía general</option>
                                            <option>Cirugía ortopédica y traumatología</option>
                                            <option>Dermatología</option>
                                            <option>Digestivo</option>
                                            <option>Genicología y Obstetricia</option>
                                            <option>Hematología</option>
                                            <option>Medicina general</option>
                                            <option>Nefrología</option>
                                            <option>Neumología</option>
                                            <option>Oncologia</option>
                                            <option>Odontología</option>
                                            <option>Oftalmología</option>
                                            <option>Pediatría</option>
                                            <option>Reabilitacion</option>
                                            <option>Radiologia</option>
                                            <option>Urgencias</option>
                                            <option>Urología</option> 
                                        </select>
                                    </div>

                                    <div class="f_column" id="prioridad">
                                        <label><b>Clasificacion</b></label>
                                        <ul style="list-style: none" class="f_txt">
                                            <li style="border:2px solid red;padding:0 10px;margin: 2px 0"><label for="11" title="Atención inmediata requerida"><input type="radio" id="11" class="s p" name="estado" value="1"> EMERGENCIA</label></li>
                                            <li style="border:2px solid orange;padding:0 10px;margin: 2px 0"><label for="22" title="Hasta 15 minutos máximo de espera"><input type="radio" id="22" class="s p" name="estado" value="2"> URGENCIA</label></li>
                                            <li style="border:2px solid yellow;padding:0 10px;margin: 2px 0"><label for="33" title="Hasta 30 minutos máximo de espera"><input type="radio" id="33" class="s p" name="estado" value="3"> URGENCIA MENOR</label></li>
                                            <li style="border:2px solid green;padding:0 10px;margin: 2px 0"><label for="44" title="Hasta 60 minutos máximo de espera"><input type="radio" id="44" class="s p" name="estado" value="4"> CONSULTA RUTINARIA</label></li>
                                            <li style="border:2px solid blue;padding:0 10px;margin: 2px 0"><label for="55" title="Hasta 120 minutos máximo de espera"><input type="radio" id="55" class="s p" name="estado" value="5"> NO PRIORITARIO</label></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div style="overflow:auto;">
                                <div style="float:right;">
                                    <!--<button type="button" id="prevBtn" onclick="nextPrev(-1)">Atrás</button>-->
                                    <button name="accion" class="btn_guardar" style="border: none;outline-color: none">Guardar</button>
                                </div>
                            </div>
                        </form>
                        <span class="cancel" onclick="closeForm(document.getElementById('registroTriaje'))" title="Cerrar el formulario">&times;</span>
                    </div>

                </div>

                <!--formulario de consulta-->
                <div class="modal" id="registroConsulta">
                    <!--                    <div class="sugerencias" id="sug">
                                            <label class="titulo">Sugerencias de pruebas</label>
                                            <ul>
                                                <li>Sugerencia #1</li>
                                                <li>Sugerencia #2</li>
                                                <li>Sugerencia #3</li>
                                            </ul>
                                        </div>-->
                    <div class="form-popup animate">
                        <form action="pruebas" method="post" class="form-container" autocomplete="off">
                            <h2>Formulario de consulta</h2>
                            <label>Paciente ID: <input type="text" name="pId" id="idCon" style="outline: none;border: none" readonly></label>
                            <div id="datosSinto">
                                <!--aqui se despliegan los datos de sintomas-->
                            </div>
                            <p class="acordeon" id="acordeon">Observaciones y notas adicionales</p>
                            <div class="panel" id="panel">
                                <div>

                                    <textarea class="textarea" class="f_txt" name="notas" placeholder="escribe las observaciones aqui..."></textarea>

                                </div>

                            </div>
                            <p class="acordeon" id="acordeon">Pruebas</p>
                            <div class="panel" id="panel">
                                 <!--                                filter-->
                                <input type="text" id="txtBuscar" onkeyup="filtrarLista()" placeholder="Buscar tratamientos.." title="Escriba un tratamiento">

                                <ul id="listaTrata" class="lista">
                                    <%@ include file="listarpruebas.jsp"%>                       
                                </ul>

                            </div>
                            <div style="overflow:auto;">
                                <div style="float:right;">
                                    <!--<button type="button" id="prevBtn" onclick="nextPrev(-1)">Atrás</button>-->
                                    <button type="submit" class="btn_guardar" style="border: none;outline-color: none" name="accion">Guardar</button>
                                </div>
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
    <script src="<%= request.getContextPath()%>/recursos/js/pacientes.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath()%>/datatable/buttons.dataTables.min.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/datatables.min.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/pdfmake.min.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/vfs_fonts.js"></script>
    <script src="<%= request.getContextPath()%>/datatable/jszip.min.js"></script>

</body>
</html>