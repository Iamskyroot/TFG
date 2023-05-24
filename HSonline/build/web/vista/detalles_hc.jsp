<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Historial ${id}</title>
        <link rel="stylesheet" type="text/css" href="recursos/css/header.css">
        <link rel="stylesheet" type="text/css" href="recursos/css/estilos_detalles.css">
        <link rel="stylesheet" type="text/css" href="asserts/css/all.css">
    </head>
    <body>
        <%@include file="no_session.jsp"%>

<!--        <ul class="navegacion" id="navegacion">
            <div class="n_item logo">
                <a href="#" class="icon">HS</a>
                <a href="#">online</a>
            </div>

            <li class="n_item enlaces "><a href="Controlador?menu=Principal">Principal</a></li>
            <li class="n_item enlaces "><a href="Controlador?menu=Interconsulta&accion=Registro">Registro</a></li>
            <li class="n_item enlaces "><a href="Controlador?menu=Pacientes&accion=Listar&page=1">Pacientes</a></li>
            <li class="n_item enlaces active"><a href="Controlador?menu=Resultados&accion=Listar">Consultas</a></li>
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
        </ul>-->


        <div class="container animate">
            <button type="button" onclick="window.print()" class="detalle-printbtn">Imprimir</button>
            <!--<a class="closebtn" href="Controlador?menu=Consultas&accion=Listar&page=1"><span class="cerrar-ficha" title="Cerrar ficha">&times;</span></a>-->
            <a href="CtrlHistorial?menu=Historial&accion=Listar&page=1"><span class="closebtn">&times;</span></a>
            <div id="detalle" class="detalle">

                <div class="detalle-content" >
                    <div class="detalle-header">


                        <div class="titulo">
                            <h2>HOSPITAL DE SAMPAKA</h2>
                        </div>
                        <div class="historial">
                            <span><b>ID:</b> ${id} </span>
                            <span><b>Medico:</b> ${sanitario.getNombre()} </span>
                            <span><b>Especialidad:</b> ${sanitario.getEspecialidad()}</span>
                        </div>

                    </div>

                    <div class="detalle-content-main">
                        <div class="imgcontainer">
                            <img src="recursos/img/user.png"/>
                            
                            <h2 style="margin: 10px auto; font-size: 30px;"><b>${datos.get(0).getNombre()}</b></h2>
                        </div>

                        <h3 class="titulo-seccion">Datos personales</h3>
                        <div class="main-seccion">
                            <div>
                                <p>Edad: <strong>${datos.get(0).getEdad()} años</strong></p>
                                <p>Sexo: <strong>${datos.get(0).getSexo()}</strong></p>
                                <p>Altura: <strong>${datos.get(1).getAltura()}cm</strong></p>
                                <p>Peso: <strong>${datos.get(1).getPeso()}Kg</strong></p>
                                <p>Temperatura: <strong>${datos.get(1).getTemperatura()} ºC</strong></p>
                            </div>
                            <div>
                                <p>Documento: <strong>${datos.get(0).getDocumento()}</strong></p>
                                <p>Direccion: <strong>${datos.get(0).getDireccion()}</strong></p>
                                <p>Telefono: <strong>${datos.get(0).getTelefono()}</strong></p>
                            </div>

                        </div>

                        <h3 class="titulo-seccion">Datos de la consulta</h3>
                        <div class="main-seccion consulta">
                            <div class="seccion-fila">
                                <div class="seccion-columna">
                                    <label class="columna-item"><strong>Sintomas:</strong></label>
                                </div>
                                <div class="seccion-columna">
                                    <label class="columna-item">
                                        <p>${datos.get(1).getSintomas()}</p>
                                    </label>
                                </div>
                            </div>
                            <div class="seccion-fila">
                                <div class="seccion-columna">
                                    <label class="columna-item"><strong>Notas</strong></label>
                                </div>
                                <div class="seccion-columna">
                                    <label class="columna-item">${datos.get(1).getNotas()}</label>
                                </div>
                            </div>
                            <div class="seccion-fila">
                                <div class="seccion-columna">
                                    <label class="columna-item"><strong>Pruebas</strong></label>
                                </div>
                                <div class="seccion-columna">
                                    <label class="columna-item">${datos.get(1).getPruebas()}</label>
                                </div>
                            </div>
                            <div class="seccion-fila">
                                <div class="seccion-columna">
                                    <label class="columna-item"><strong>Dianostico</strong></label>
                                </div>
                                <div class="seccion-columna">
                                    <label class="columna-item" style="color: red">${datos.get(1).getDianosticos()}</label>
                                </div>
                            </div>


                        </div>

                        <h3 class="titulo-seccion">Tratamiento</h3>
                        <div class="main-seccion tratamiento">
                            <table>
                                <thead style="font-weight: bold">
                                    <tr>
                                        <td>Medicamento</td>
                                        <td>Cantidad</td>
                                        <td>Dosis</td>
                                        <td>Frecuencia</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${prescripciones}" var="pres">
                                    <tr>
                                        <td>${pres.getMedicamento()}</td>
                                        <td>${pres.getCantidad()}</td>
                                        <td>${pres.getDosis()}</td>
                                        <td>${pres.getFrecuencia()}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--<p>${datos.get(1).getTratamiento()}</p>-->
                        </div>


                    </div>
                </div>
            </div>
        </div>
<!--        <div class="container animate">
            <div class="detalle-content ">
                <button type="button" onclick="window.print()" class="detalle-printbtn receta">Imprimir</button>
                <div class="detalle-content-main">

                </div>
            </div>
        </div>-->



        <script src="recursos/js/header.js" type="text/javascript"></script>

    </body>
</html>