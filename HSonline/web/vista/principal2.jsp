
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital de sampaka -> principal</title>
        <link href="<%=request.getContextPath()%>/recursos/css/header.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/recursos/css/bootstrap.min.css"/>-->
        <link href="<%= request.getContextPath()%>/recursos/css/home_body_1.css" rel="stylesheet" type="text/css"/>
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
            <li class="n_item enlaces"><a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=1">Mis consultas</a></li>
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
                    <a href="Controlador?menu=Perfil&accion=citas&id=${usuario.getCodigo()}&doc=${usuario.getDocumento()}&page=1">Mis consultas</a>
                    <a href="Controlador?menu=Perfil&accion=user_perfil&act=ver" >Mi perfil</a>
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
            <div class="main_item">
                ${respuesta}
                <div class="titulo">Hospital de Sampaka online</div>
                <div class="subtitulo">Pide cita sin salir de casa</div>
                <button class="btn" onclick="document.getElementById('modal').style.display = 'block'">Pedir cita</button>

            </div>
        </div>
        <div class="portofollo">
            <div><h3>Nuestros servicios<h3></div>
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

        <!--seccion de citas ya agendadas -->
        <div class="callout" id="callout">
            <div class="callout-header">Siguiente cita</div>
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">×</span>
            <div class="callout-container" id="cita">
                <%@include file="ajaxpages/confirmacioncita.jsp"%>
            </div>
        </div>

        <!--Popup-->
        <div class="modal" id="modal">

            <div class="form-popup animate">
                <form action="RegistrarCita" method="post" class="form-container">
                    <h2>Formulario de solicitud de cita medica</h2>
                    <fieldset>
                        <legend>Datos personales</legend>
                        <div class="f_row">
                            <div class="f_column">
                                <label>Documento</label>
                                <input type="text" name="doc" class="f_txt" value="${usuario.getDocumento()}"  readonly>
                            </div>
                            <div class="f_column">
                                <label>Nombre</label>
                                <input type="text" name="nombre" class="f_txt" value="${usuario.getNombre()}" readonly>
                            </div>

                        </div>


                    </fieldset>

                    <fieldset>
                        <legend>Motivo</legend>
                        <div class="f_row">
                            <div class="f_column">
                                <label>Seleccione el motivo</label>
                                <select name="motivo" class="f_txt esp" required>
                                    <option></option>
                                    <option>Malestar</option>
                                    <option>Revision</option>
                                </select>
                            </div>
                            <div class="f_column">
                                <label>Seleccione el servicio</label>
                                <select name="servicio" class="f_txt esp" required>
                                    <option></option>
                                    <option>Consulta</option>
                                    <option>Ecografia</option>
                                    <option>Odontologia</option>
                                    <option>Genicologia</option>
                                </select>
                            </div>
                        </div>

                        <div class="f_row">
                            <div class="f_column">
                                <label>Detalles de la cita o notas adicionales</label>
                                <textarea class="f_txt" name="notas" placeholder="Escribe los detalles aqui..."></textarea>
                            </div>
                        </div>

                    </fieldset>

                    <div class="f_row">
                        <button type="submit" name="accion" class="btn_guardar">Enviar</button>
                    </div>

                </form>
                <span class="cancel" onclick="closeForm()" title="Cerrar el formulario">&times;</span>
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