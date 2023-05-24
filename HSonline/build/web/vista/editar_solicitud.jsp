<%-- 
    Document   : editar_solicitud
    Created on : 19-mar-2023, 20:09:11
    Author     : Skyroot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Agendar cita</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/recursos/css/estilos_solicitud.css">
    </head>
    <body>
        

        <form action="solicitud" method="post" class="form">
            ${estado}
            <h2>Agendar cita</h2>

            <!-- Progress -->
            <div class="progressbar">
                <div class="progress" id="progress"></div>
                <div class="progress-step progress-step-active" data-title="Info"></div>
                <div class="progress-step" data-title="Agendar"></div>
                <div class="progress-step" data-title="Guardar"></div>
            </div>
            <!-- 4teps -->

            <div class="form-step form-step-active">

                <div class="input_group">
                    <div class="f_row">
                        <div class="f_column">
                            <label>Codigo</label>
                            <input type="text" name="cod" value="${solicitud.getCodigo()}" class="f_txt" readonly required>
                        </div>
                        <div class="f_column">
                            <label>Nombre</label>
                            <input type="text" name="nom" value="${solicitud.getNombre()}"  class="f_txt" readonly>
                        </div>

                    </div>
                </div>
                <div class="input_group">
                    <div class="f_row">

                        <div class="f_column">
                            <label>Motivo</label>
                            <input type="text" name="motiv" value="${solicitud.getMotivo()}"  class="f_txt" readonly>
                        </div>

                        <div class="f_column">
                            <label>Servicio</label>
                            <input type="text" name="serv" value="${solicitud.getServicio()}" class="f_txt" readonly>
                        </div>
                    </div>
                </div>


                <div class="">
                    <a href="#" class="btn next-btn size_50 ml_auto">Siguiente</a>
                </div>
            </div>

            <div class="form-step">
                <div class="input_group">
                    <label>Inicio</label>
                    <input type="datetime-local" class="f_txt" name="fechaInicio">
                </div>
                <div class="input_group">
                    <label>Fin</label>
                    <input type="datetime-local" class="f_txt" name="fechaFin">
                </div>

                <div class="input_group">
                    <label>Médico</label>
                    <input type="text" class="f_txt" name="medico" placeholder="Nombre médico">
                </div>
                <div class="btn_group">
                    <a href="#" class="btn prev-btn">Anterior</a>
                    <a href="#" class="btn next-btn">Siguiente</a>

                </div>
            </div>

            <div class="form-step">
                <div class="input_group">

                </div>
                <div class="input_group">

                </div>
                <div class="btn_group">
                    <a href="#" class="btn prev-btn">Anterior</a>
                    <input type="submit" name="accion" class="btn" style="background-color: #04AA6D" value="Guardar">

                </div>
            </div>

        </form>
        <script src="<%= request.getContextPath()%>/recursos/js/mod_cita.js" type="text/javascript"></script>
        
    </body>
</html>
