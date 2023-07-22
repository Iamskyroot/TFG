<%-- 
    Document   : index
    Created on : 13-dic-2022, 23:36:06
    Author     : Skyroot
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Principal</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/recursos/css/home_index.css">
    </head>
    <body>

        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="Controlador?menu=index" class="icon">HS</a>
                <a href="Controlador?menu=index">online</a>
            </div>

            <li class="n_item enlaces active"><a href="Controlador?menu=index">Principal</a></li>
            <li class="n_item enlaces"><a href="<%= request.getContextPath()%>/vista/contacto.jsp">Contacto</a></li>
            <li class="n_item dropdown"><a href="Controlador?menu=Login&accion=0">Iniciar sesion</a></li>

            <li class="btn_menu"><a href="javascript:void(0);" onclick="menuResponsive()">
                    <div class="open" id="open" title="Abrir menu">
                        <div class="m"></div>
                        <div class="m"></div>
                        <div class="m"></div>
                    </div>
                    <div class="close" id="close" title="Cerrar menu">&times;</div>
                </a></li>
        </ul>
        <div class="main-content">

            <!-- Full-width images with number and caption text -->
            <div class="mySlides fade">
                <!-- <div class="numbertext">1 / 3</div> -->
                <img src="<%= request.getContextPath()%>/recursos/img/h_exterior2.jpg">
                <div class="text">Recepción. Parte exterior</div>
            </div>

            <div class="mySlides fade">
                <!-- <div class="numbertext">2 / 3</div> -->
                <img src="<%= request.getContextPath()%>/recursos/img/recepcion.jpg">
                <div class="text">Recepción. Parte interior</div>
            </div>

            <div class="mySlides fade">
                <!-- <div class="numbertext">3 / 3</div> -->
                <img src="<%= request.getContextPath()%>/recursos/img/pabellon.jpg">
                <div class="text">Salas de hospitalización</div>
            </div>

            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
            <br>

            <!-- The dots/circles -->
            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
        </div>
        <div class="row">
            <div class="column aside">
                <h2>Programacion y anuncios</h2><br>
                <div class="content">
                    <%
                        Conexion con = new Conexion();
                        Statement st = null;
                        String sql = "SELECT * FROM programacion";
                        try {
                            st = con.conectar().createStatement();
                            ResultSet rs = st.executeQuery(sql);
                            rs.afterLast();
                            while (rs.previous()) {


                    %>
                    <div class="a-item">
                        <h3><%= rs.getString("titulo")%></h3>
                        <p>Fecha: <%= rs.getString("fecha")%></p>
                        <p><%= rs.getString("descripcion")%></p>
                        <p><b>Horas permitidas: </b><%= rs.getString("inicio")%> - <%= rs.getString("fin")%></p>
                    </div>

                    <%
                            }
                        } catch (Exception e) {
                            System.out.println("Error al consultar la programacion. " + e.getMessage());
                        }
                    %>
                </div>
            </div>
            <div class="column main">
                <div class="portofollo">
                    <div>
                        <h3>Nuestros servicios<h3>
                    </div>
                    <div class="row">
                        <div class="column">
                            <div class="content">
                                <img src="<%=request.getContextPath()%>/recursos/img/genicologia.png" alt="Genicologia" style="width:100%">
                                <h3>Genicologia</h3>
                                <p>La Ginecología y Obstetricia nace como una especialidad que se dedica al cuidado de la salud de los órganos reproductores femeninos y al manejo de las complicaciones obstétricas, incluso a través de intervenciones quirúrgicas.</p>
                            </div>
                        </div>
                        <div class="column">
                            <div class="content">
                                <img src="<%=request.getContextPath()%>/recursos/img/consulta.png" alt="Consulta" style="width:100%">
                                <h3>Dianostico por imagen</h3>
                                <p>Los servicios de diagnóstico por imágenes hacen referencia a la realización de exámenes de diagnóstico por imágenes para ver y tratar mejor las afecciones médicas</p>
                            </div>
                        </div>
                        <div class="column">
                            <div class="content">
                                <img src="<%=request.getContextPath()%>/recursos/img/odontologia.jpeg" alt="Odontologia" style="width:100%">
                                <h3>Odontología</h3>
                                <p>Ofrecemos diagnóstico, tratamiento y prevención de las enfermedades del aparato estomatognático</p>
                            </div>
                        </div>
                        <div class="column">
                            <div class="content">
                                <img src="<%=request.getContextPath()%>/recursos/img/consulta.png" alt="Mountains" style="width:100%">
                                <h3>Consulta</h3>
                                <p>Consulta (personal o telefónica) a un profesional médico titulado para diagnóstico, examen, tratamiento, seguimiento, consejo o cualquier otro trámite por algún problema, molestia o enfermedad de la persona entrevistada.</p>
                            </div>
                        </div>
                    </div>


                </div>
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
<script src="<%= request.getContextPath()%>/recursos/js/index.js" type="text/javascript"></script>
<script src="<%= request.getContextPath()%>/recursos/js/header.js" type="text/javascript"></script>
</body>
</html>