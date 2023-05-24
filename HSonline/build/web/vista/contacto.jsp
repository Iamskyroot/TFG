<%-- 
    Document   : contacto
    Created on : 22-may-2023, 22:09:55
    Author     : Skyroot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Contacto</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/recursos/css/home_index.css">
    </head>
    <body>

        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces"><a href="<%= request.getContextPath()%>/Controlador?menu=index">Principal</a></li>
            <li class="n_item enlaces active"><a href="<%= request.getContextPath()%>/vista/contacto.jsp">Contacto</a></li>
            <li class="n_item dropdown"><a href="#">Iniciar sesion</a></li>

            <li class="btn_menu"><a href="javascript:void(0);" onclick="menuResponsive()">
                    <div class="open" id="open" title="Abrir menu">
                        <div class="m"></div>
                        <div class="m"></div>
                        <div class="m"></div>
                    </div>
                    <div class="close" id="close" title="Cerrar menu">&times;</div>
                </a></li>
        </ul>

        <div style="text-align:center">
            <h2>Contactar con nosotros</h2>
            <p>Rellena el formulario para contactar con nosotros.</p>
        </div>
        <div class="main">
            <div class="main-content" style="text-align: center;">
                <h3>Ubicacion en el mapa</h3>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3981.4065990890826!2d8.731151099999998!3d3.7211727999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x10669d2b6f1538d1%3A0xe0592fd3f01672c6!2sHospital%20de%20Sampaka!5e0!3m2!1ses!2s!4v1684711129752!5m2!1ses!2s" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="main-aside">
                <form action="/action_page.php">
                    <label for="nom">Nombre completo</label>
                    <input type="text" id="nom" name="nom" placeholder="Nombre">
                    <label for="tel">Telefono</label>
                    <input type="text" id="tel" name="no" placeholder="Nº de telefono">
                    <label for="dir">¿Desde dónde nos contactas?</label>
                    <input type="text" id="dir" name="dir" placeholder="Pais, ciudad, barrio">
                    <label for="motivo">Asunto</label>
                    <textarea id="motivo" name="motivo" placeholder="Escribe aqi la razon de contactar con nosotros..." style="height:170px"></textarea>
                    <input type="submit" value="Enviar">
                </form>
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

    </body>
</html>
