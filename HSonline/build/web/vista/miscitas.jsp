<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital de sampaka -> citas</title>
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>-->
        <link href="<%=request.getContextPath()%>/recursos/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath()%>/recursos/css/miscitas.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath()%>/assets/css/all.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="no_session.jsp"%>

        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces"><a href="Controlador?menu=Inicio&accion=">Principal</a></li>
            <li class="n_item enlaces active"><a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=1">Mis consultas</a></li>
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
                    <a href="Controlador?menu=Inicio&accion=">Siguiente cita</a>
                    <a href="Controlador?menu=Perfil&accion=user_perfil&act=ver" >Mi perfil</a>
                    <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=1" >Mis consultas</a>
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

        <div class="main_container">
            <div class="table-responsive">
                <table class="table table-hover table-striped " id="tab2">
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>motivo</td>
                            <td>fecha</td>
                            <td>Acciones</td>
                        </tr>
                    </thead>
                    <tbody id="res">
                        <c:forEach  items="${consultas}" var="c">

                            <tr>
                                <td>${c.getCodigo()}</td>
                                <td>${c.getMotivo()}</td>
                                <td>${c.getFecha_consulta()}</td>
                                <td class="btn-group-sm">
                                    <a href="Controlador?menu=Detalles&accion=Mostrar&codPaciente=${c.getPaciente_id()}&codConsulta=${c.getCodigo()}&mId=${c.getMedico_id()}"><i class="fas fa-eye"> ver</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="paginacion">
                    <!--display previous link except for the first page-->
                    <c:if test="${pagActual != 1}">
                        <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=${pagActual - 1}"><i class="fas fa-angle-double-left"></i></a>
                        </c:if>
                    <!--displaying page numbers-->
                    <c:forEach begin="1" end="${noPag}" var="i">
                        <c:choose>
                            <c:when test="${pagActual eq i}">
                                <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=${i}" class="active">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!--display previous link except for the first page-->
                    <c:if test="${pagActual lt noPag}">
                        <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=${pagActual + 1}"><i class="fas fa-angle-double-right"></i></a>
                        </c:if>

                </div>
                <label style="float: right;font-weight: bold;margin-right: 10px">Total: ${noFilas}</label>

            </div>
            
        </div>

        <div class="footer">
            <div class="f_item">
                <h4>informacion de contacto</h4>
                <p>Direccion: <strong>Sampaka - al lado del Hospital Psiquiatrico</strong></p>
                <p>Telefono: <strong>222 345 562/333 356 246</strong></p>
                Email: <a>hsonlinegq@gmail.com</a>
            </div>
            <div class="f_item">
                <h4>Nuestros servicios</h4>
                <ul>
                    <li>Consultas</li>
                    <li>Hospitalizacion</li>
                    <li>Urgencias</li>
                    <li>Dianostico por imagen</li>
                    <li>UCI</li>
                </ul>
            </div>
            <div class="f_item">
                <h4>Politica de privacidad</h4>
                <p>TFG UNGE &copy;2022 Derechos reservados</p>
                <p>Autores: <b>Valentin E. Angono</b> y <b>Javier Clemente Mangue</b></p>
            </div>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('registro');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            }
            //close form
            function closeForm() {
                document.getElementById("modal").style.display = "none";
            }
        </script>
        <script src="<%= request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/admin_panel.js"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/header.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/recursos/js/mod_cita.js" type="text/javascript"></script>

    </body>
</html>