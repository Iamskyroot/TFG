<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil de usuario</title>
        <link href="<%=request.getContextPath()%>/recursos/css/header.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>-->
        <link href="<%= request.getContextPath()%>/recursos/css/home_body_1.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath()%>/recursos/css/perfil.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath()%>/assets/css/all.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="no_session.jsp"%>



        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces active"><a href="Controlador?menu=Inicio&accion=">Principal</a></li>
            <li class="n_item enlaces"><a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=1">Mis citas</a></li>
            <li class="n_item enlaces"><a href="#">Contacto</a></li>
            <div class="n_item dropdown">
                <button class="dropbtn">
                    <i class="fas fa-user-circle" style="font-size: 24px"></i>
                    ${usuario.getNombre()}
                    <i class="fas fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <div class="user-icon">${letra}</div>
                    <div class="user-item"><span>${usuario.getNombre()}</span></div>
                    <a href="#" onclick="mostrarConfirmacionCita(${usuario.getDocumento()}, document.getElementById('callout'))">Siguiente cita</a>
                    <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=1" >Mis consultas</a>
                    <a href="Controlador?menu=Perfil&accion=user_perfil" >Mi perfil</a>
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


        <div class="container-fluid">
            ${alert}
            <div class="container-data perfil-container">

                <div class="imgcontainer">
                    <img src="<%= request.getContextPath()%>/recursos/img/4.jpg" alt="Perfil" class="img-perfil">
                    <span class="edit-img"><i class="fas fa-pen"></i></span>
                    <h3>Mi perfil</h3>
                    <button type="button" onclick="editarPerfil()" class="edit-btn">Editar perfil</button>
                </div>
                <form action="userperfil" method="get" class="form-container" onsubmit="return checkPassword()">

                    <fieldset>
                        <legend>Datos personales</legend>
                        <div class="f_row">
                            <div class="f_column">
                                <label>Nombre</label>
                                <input type="text" name="nombre" id="nom" class="f_txt" value="${usuario.getNombre()}" disabled="disabled" required>
                            </div>
                            <div class="f_column">
                                <label>Edad</label>
                                <input type="number" name="edad" id="edad" min="18" class="f_txt" value="${usuario.getEdad()}" disabled="disabled" required>
                            </div>

                        </div>
                        <div class="f_row">

                            <div class="f_column">
                                <label>Sexo</label>
                                <select name="sexo" class="f_txt esp" id="sexo" required>
                                    <option>${usuario.getSexo()}</option>
                                    <option>Hombre</option>
                                    <option>Mujer</option>
                                </select>
                            </div>

                            <div class="f_column">
                                <label>Documento</label>
                                <input type="text" name="doc" id="doc" class="f_txt" value="${usuario.getDocumento()}" disabled="disabled" readonly>
                            </div>
                        </div>
                        <div class="f_row">

                            <div class="f_column">
                                <label>Direccion</label>
                                <input type="text" name="dir" id="dir" class="f_txt" value="${usuario.getDireccion()}" disabled="disabled" required>
                            </div>

                            <div class="f_column">
                                <label>Telefono</label>
                                <input type="text" name="tel" id="tel" class="f_txt" value="${usuario.getTelefono()}" disabled="disabled">
                            </div>
                        </div>

                    </fieldset>

                    <fieldset>
                        <legend>Datos de usuario</legend>
                        <div class="f_row">
                            <div class="f_column">
                                <label>Usuario</label>
                                <input type="text" name="user" id="user" class="f_txt" value="${usuario.getUsuario()}" disabled="disabled">
                            </div>
                            <div class="f_column">
                                <label>Contraseña</label>
                                <input type="password" name="psw" id="passw" class="f_txt" value="${usuario.getContrasena()}" disabled="disabled">
                            </div>
                        </div>

                        <div class="f_row">
                            <div class="f_column">
                                <label></label>
                                <input type="hidden" class="f_txt">
                            </div>
                            <div class="f_column">
                                <label>Repita la contraseña</label>
                                <input type="password" name="psw2" id="passw2" class="f_txt" value="${usuario.getContrasena()}" disabled="disabled">
                            </div>
                        </div>
                            <label><input type="checkbox" onclick="showPassword()"> Mostrar contraseña</label>
                    </fieldset>

                    <div class="f_row">
                        <button type="submit" name="accion" id="btnGuardar" class="btn_guardar" style="display: none">Guardar</button>
                    </div>

                </form>

            </div>
        </div>


    </div>

</div>

<script src="<%= request.getContextPath()%>/recursos/js/header.js" type="text/javascript"></script>
<!--<script src="<%= request.getContextPath()%>/recursos/js/mod_hc.js" type="text/javascript"></script>-->

</body>
</html>