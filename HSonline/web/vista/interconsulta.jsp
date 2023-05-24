<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion hospitalaria -> interconsulta</title>
        <link rel="stylesheet" type="text/css" href="recursos/css/header.css">
        <link rel="stylesheet" type="text/css" href="recursos/css/estilos_interconsulta.css">
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="no_session.jsp"%>

        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces "><a href="Controlador?menu=Principal">Principal</a></li>
            <li class="n_item enlaces active"><a href="Controlador?menu=Interconsulta&accion=Registro">Registro</a></li>
            <li class="n_item enlaces"><a href="Controlador?menu=Pacientes&accion=Listar&page=1">Pacientes</a></li>
            <li class="n_item enlaces"><a href="Controlador?menu=Consultas&accion=Listar&page=1">Consultas</a></li>
            <div class="n_item dropdown">
                <button class="dropbtn">
                    <i class="fas fa-user-circle" style="font-size: 24px"></i>
                    ${usuario.getNombre()}
                    
                </button>
                <div class="dropdown-content">
                    <div class="user-icon">U</div>
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

        ${alert}


        <%!
            public String fecha() {

                LocalDateTime myDateObj = LocalDateTime.now();
                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                String formattedDate = myDateObj.format(myFormatObj);
                return formattedDate;
            }
        %>


        <div class="container">

            <div class="form_container">

                <div class="top_content">
                    <h3>Registro de nuevo paciente</h3>
                </div>
                <div class="date">
                    <p><strong>Fecha y hora: </strong><%=fecha()%></p>
                </div>

                <div class="container_form">
                    <p id="estado" style="color: red; text-align: center;position: relative;">${error}</p>
                    <p id="estado" style="color: #04AA6D; font-weight: bold; text-align: center;position: relative;">${estado}</p>

                    <form action="RegistrarConsulta" method="POST">
                        <fieldset class="seccion_form">
                            <legend>Datos personales</legend>
                            <div class="row">
                                <div class="column">
                                    <p>Nombre</p>
                                    <input type="text" name="nombre" value="${paciente.getNombre()}"  autofocus="autofocus" min="2" required="required">
                                </div>
                                <div class="column">
                                    <p>Edad</p>
                                    <input type="number" name="edad" value="${paciente.getEdad()}"  min="2" max="120">
                                </div>
                                <div class="column">
                                    <p>Sexo</p>
                                    <select name="sexo">
                                        <option>${paciente.getSexo()}</option>
                                        <option value="Hombre">Hombre</option>
                                        <option value="Mujer">Mujer</option>
                                    </select>
                                </div>

                            </div>

                            <div class="row">
                                <div class="column">
                                    <p>Documento</p>
                                    <input type="text" name="documento" value="${paciente.getDocumento()}" min="1">
                                </div>
                                <div class="column">
                                    <p>Direccion</p>
                                    <input type="text" name="direccion" value="${paciente.getDireccion()}" min="1">
                                </div>
                                <div class="column">
                                    <p>telefono</p>
                                    <input type="text" name="telefono" value="${paciente.getTelefono()}">
                                </div>

                            </div>
                        </fieldset>
                        <!--numero de muestra-->   
                        <div>
                            <label id="codigoConsulta" style="color: #269abc; font-weight: bold;margin: 4px 20px 0 4px;">${txtMuestra}${muestra}</label>

                        </div>

                        <fieldset class="seccion_form">
                            <legend>Datos de la consulta</legend>
                            <div class="row">
                                <div class="column">
                                    <p>Motivo</p>
                                    <select name="motivo" id="motivo" required>
                                        <option value="Malestar">Malestar</option>
                                        <option value="Revision">Revision medica</option>
                                    </select>
                                </div>
                                <div class="column" style="visibility: hidden;">

                                </div>
                                <div class="column" style="visibility: hidden;">

                                </div>

                            </div>
                            <div class="row">
                                <div class="column">
                                    <p>Altura</p>
                                    <input type="text" name="altura" min="1" placeholder="cm">
                                </div>
                                <div class="column">
                                    <p>Peso</p>
                                    <input type="text" name="peso" min="1" placeholder="Kg">
                                </div>
                                <div class="column">
                                    <p>Temperatura</p>
                                    <input type="text" name="temperatura" min="1" placeholder=" ºC">
                                </div>
                            </div>
                            <div class="row" id="sintomas">
                                <div class="column">
                                    <p>Sintomas</p>
                                    <textarea class="textarea" name="sintomas" placeholder="Escribe aqui..."></textarea>
                                </div>
                            </div>


                            <p class="acordeon" id="acordeon">Observaciones y notas adicionales</p>
                            <div class="panel" id="panel">
                                <div>

                                    <textarea class="textarea" name="notas" placeholder="escribe las observaciones aqui..."></textarea>

                                </div>
                                <!--                            <div class="row">
                                                                <div class="column">
                                                                    <p>Notas adicionales</p>
                                                                    <textarea class="textarea" name="notas" placeholder="Notas adicionales"></textarea>
                                                                </div>
                                                            </div>-->
                            </div>
                            <p class="acordeon" id="acordeon">Pruebas a realizar</p>
                            <div class="panel" id="panel">
                                <div>

                                    <textarea class="textarea" name="pruebas" placeholder="Escribe las pruebas aqui..."></textarea>
                                </div>
                            </div>
                        </fieldset>

                        <div class="row btn">
                            <input type="submit" class="btn-bt btn-gc" name="accion" value="Guardar consulta">
<!--                            <button type="submit" class="btn-bt btn-gc" name="accion"><i class="fas fa-plus" style="font-size: 18px"></i> Guardar consulta</button>
                            <button type="submit" class="btn-bt" name="accion"><i class="fas fa-save" style="font-size: 18px"></i> Guardar</button>-->
                            <input type="submit" class="btn-bt" name="accion" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <script type="text/javascript" src="recursos/js/mod_interconsulta.js"></script>
        <script>
                //close alert
                var close = document.getElementsByClassName("closebtn");
                var i;

                for (i = 0; i < close.length; i++) {
                    close[i].onclick = function () {
                        var div = this.parentElement;
                        div.style.opacity = "0";
                        setTimeout(function () {
                            div.style.display = "none";
                        }, 600);
                    }
                }

        </script>
        <script src="recursos/js/header.js" type="text/javascript"></script>
    </body>
</html>