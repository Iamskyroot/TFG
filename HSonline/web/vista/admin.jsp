<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@page import="modelo.Sanitario"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital de sampaka</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/admin_panel.css"/>
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
                    <li><a href="Controlador?menu=Principal" onclick="toggleActive(this)" class="link-active" id="home" title="Principal">
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
                    <div class="row filtro-estadisticas">
                        <div class="top_container filter_div">

                            <a class="filter_item active" id="nn" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-list-ol"></i> Todos los registros</a>
                            <a class="filter_item" id="todo" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-calendar-day"></i> Hoy</a>
                            <a class="filter_item" id="orden" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-calendar-week"></i> Esta semana</a>
                            <a class="filter_item" id="adult" href="#" onclick="filtrarTratamiento(this)"><i class="fas fa-calendar"></i> Este mes</a>

                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-4 col-md-6 p-2">
                            <div class="card border-primary rounded-0">
                                <div class="card-header bg-primary rounded-0 c1">
                                    <h5 class="card-title text-white mb-1">Pacientes</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-primary text-center"><i class="fas fa-calendar" style="color: #007bff;"></i> ${pacientes}</h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 p-2">
                            <div class="card border-success rounded-0">
                                <div class="card-header bg-success rounded-0">
                                    <h5 class="card-title text-white mb-1">Tratamientos</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-success text-center"><i class="fas fa-pills" style="color: #28a745;"></i> ${tratamientos}</h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 p-2">
                            <div class="card border-danger rounded-0">
                                <div class="card-header bg-danger rounded-0">
                                    <h5 class="card-title text-white mb-1">Consultas</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-danger text-center"><i class="fas fa-stethoscope" style="color: #dc3545;"></i> ${consultas}</h1>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-lg-4 col-md-6 p-2">
                            <div class="card border-primary rounded-0">
                                <div class="card-header bg-primary rounded-0">
                                    <h5 class="card-title text-white mb-1">Personal sanitario</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-primary text-center"><i class="fas fa-user-md" style="color: #007bff;"></i> ${personal}</h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 p-2">
                            <div class="card border-success rounded-0">
                                <div class="card-header bg-success rounded-0">
                                    <h5 class="card-title text-white mb-1">Hospitalizaciones</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-success text-center"><i class="fas fa-procedures" style="color: #28a745;"></i> ${hospitalizados}</h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 p-2">
                            <div class="card border-danger rounded-0">
                                <div class="card-header bg-danger rounded-0">
                                    <h5 class="card-title text-white mb-1">Historias clinicas</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-danger text-center"><i class="fas fa-file-alt" style="color: #dc3545;"></i> ${hc}</h1>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-6 p-2">
                            <div class="card border-primary rounded-0">
                                <div class="card-header bg-primary rounded-0 c1">
                                    <h5 class="card-title text-white mb-1">Citas</h5>
                                </div>
                                <div class="card-body">
                                    <h1 class="display-4 font-weight-bold text-primary text-center"><i class="fas fa-calendar" style="color: #007bff;"></i> ${citas}</h1>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="container-fluid">
                        <div class="container-data">
                            <div class="">
                                <h1 class="display-4">Tablero</h1>
                            </div>
                            
                            <table class="table table-bordered table-responsive" style="background-color: white">
                                <thead>
                                    <tr>
                                        
                                        <th>Lunes</th>
                                        <th>Martes</th>
                                        <th>Miercoles</th>
                                        <th>Jueves</th>
                                        <th>Viernes</th>
                                        <th>Sabado</th>
                                        <th>Domingo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
//                                        Conexion con = new Conexion();
//                                            Statement st = null;
//                                            ResultSet rs = null;
//                                            String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id";
//                                            try {
//                                                st = con.conectar().createStatement();
//                                                rs = st.executeQuery(sql);
//                                                while (rs.next()) {
//                                                    out.print("<tr>");
//                                                    for (int i = 0; i < 7; i++) {
//                                                            if (rs.getString("dia_semana").equals("lunes")) {
//                                                                out.print("<td>" + rs.getString("nombre") + "</td>");
//                                                            }
//                                                            if (rs.getString("dia_semana").equals("martes")) {
//                                                                out.print("<td>" + rs.getString("nombre") + "</td>");
//                                                            }
//                                                    }
//                                                    out.print("</tr>");
//                                                }
//                                            } catch (Exception e) {
//                                                System.out.println(e.getMessage());
//                                            }
                                    %>
                                    <tr>
                                        <td>
                                            <c:forEach items="${lunes}" var="l">
                                                <span>${l.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${martes}" var="m">
                                                <span>${m.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${miercoles}" var="m">
                                                <span>${m.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${jueves}" var="j">
                                                <span>${j.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${viernes}" var="v">
                                                <span>${v.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${sabado}" var="s">
                                                <span>${s.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${domingo}" var="m">
                                                <span>${m.getNombre_sanitario()},</span>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!--<div id="tablero"></div>-->
                        </div>

                    </div>
                </div>
            </div>
            <script src="<%=request.getContextPath()%>/recursos/js/jquery-3.6.4.min.js"></script>
            <script src="<%=request.getContextPath()%>/recursos/js/bootstrap.min.js"></script>
            <script src="<%=request.getContextPath()%>/recursos/js/home.js"></script>
            <script src="<%=request.getContextPath()%>/recursos/js/admin_panel.js"></script>
            <script src="<%= request.getContextPath()%>/recursos/js/index.global.min.js"></script>
    </body>

</html>
