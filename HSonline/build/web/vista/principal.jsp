<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital de sampaka -> principal</title>
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/header.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/home_body.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/footer.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="no_session.jsp"%>

        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces active"><a href="Controlador?menu=Principal">Principal</a></li>
            <li class="n_item enlaces"><a href="#">Contacto</a></li>
            <div class="n_item dropdown">
                <button class="dropbtn">
                    <i class="fas fa-user-circle" style="font-size: 24px"></i>
                    ${usuario.getNombre()}
                    
                </button>
                <div class="dropdown-content">
                    <div class="user-icon">${letra}</div>
                    <div class="user-item"><span>${usuario.getNombre()}</span></div>
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

        <h1 class="title">Modulos de gestion</h1>

        <div class="container">


            <div class="container_main">

                <div class="main_cards c1">
                    <a href="CtrlCitas?menu=Citas&accion=listar&page=1">
                        <img alt="img" src="recursos/img/fa-hospital-user.png">
                        <span class="card_item card_name">Gestion de citas medicas</span>
                    </a>

                </div>
                <!--<a class="card_item card_link" href="CtrlCitas?menu=Citas">Acceder</a>-->

                <div class="main_cards c2">
                    <a href="CtrlDoctores?menu=Doctores&accion=Listar&page=1">
                        <img alt="img" src="recursos/img/fa-calendar-alt.png">
                        <span class="card_item card_name">Gestion de doctores y horarios</span>
                    </a>

                </div>
                <!--<a class="card_item card_link" href="CtrlDoctores?menu=Doctores">Acceder</a>-->

                <div class="main_cards c3">
                    <a href="Controlador?menu=Interconsulta&accion=Registro">
                        <img alt="img" src="recursos/img/fa-user-md.png">
                        <span class="card_item card_name">Gestion interconsulta</span>
                    </a>

                </div>
                <!--<a class="card_item card_link" href="Controlador?menu=Interconsulta&accion=Mostrar">Acceder</a>-->

                <div class="main_cards c4">
                    <a href="CtrlTratamiento?menu=Tratamiento&accion=Listar&page=1">
                        <img alt="img" src="recursos/img/fa-capsules.png">
                        <span class="card_item card_name">Gestion de tratamientos</span>
                    </a>

                </div>
                <!--<a class="card_item card_link" href="CtrlTratamiento?menu=Tratamiento">Acceder</a>-->

                <div class="main_cards c5">
                    <a href="CtrlHospitalizacion?menu=Hospitalizacion&accion=Listar">
                        <img alt="img" src="recursos/img/fa-procedures.png">
                        <span class="card_item card_name">Gestion de hospitalizacion</span>
                    </a>

                </div>
                <!--<a class="card_item card_link" href="CtrlHospitalizacion?menu=Hospitalizacion">Acceder</a>-->

                <div class="main_cards c6">
                    <a href="CtrlHistorial?menu=Historial">
                        <img alt="img" src="recursos/img/fa-info-circle.png">
                        <span class="card_item card_name">Gestion de historial clinico</span>
                    </a>

                </div>
                <!--<a class="card_item card_link" href="CtrlHistorial?menu=Historial">Acceder</a>-->

            </div>

            <div class="aside">
                <div class="container_aside">

                    <p class="content_item">Lunes 22-11-2022</p>
                    <h4>Horario de enfermer@s</h4>
                    <table class="calendar">
                        <tr class="t_head">
                            <td>Turno</td>
                            <td>Lunes</td>
                            <td>Martes</td>
                            <td>Miercoles</td>
                            <td>Jueves</td>
                            <td>Viernes</td>
                            <td>Sabado</td>
                            <td>Domingo</td>
                        </tr>
                        <tr>
                            <td>Mañana 7:00-14h</td>
                            <td>Camilo Nsue, Natalia Rose, Ana Guti</td>
                            <td>Miguel, Marcos, Juan</td>
                            <td>Antonio, Miguel</td>
                            <td>Andres, Juan</td>
                            <td>Angel, Bruno, Samanta</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Tarde 14h-22h</td>
                            <td>Camilo Nsue, Natalia Rose, Ana Guti</td>
                            <td>Miguel, Marcos, Juan</td>
                            <td>Antonio, Miguel</td>
                            <td>Andres, Juan</td>
                            <td>Angel, Bruno, Samanta</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>

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

        <script src="recursos/js/header.js" type="text/javascript"></script>

    </body>
</html>