<%-- 
    Document   : index
    Created on : 13-dic-2022, 23:36:06
    Author     : Skyroot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="recursos/css/estilos_login.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>



        <div class="main">
            <div class="contenedor">
                <div class="card">
                ${respuesta}
                    <div class="card-body">

                        <form action="ValidarLogin" method="POST" autocomplete="off">
                            <div class="group">
                                <h2>Hospital de Sampaka</h2>
                                <label>Control de acceso al sistema</label>
                            </div>
                            <div class="group">
                                <input type="text" class="i-user" name="usuario" autofocus="autofocus"  placeholder="Usuario" required="">
                            </div>
                            <div class="group">
                                <input type="password" class="i-pass" id="passw" name="passw" placeholder="Contraseña">
                                <i class="fas fa-eye-slash show-passw" id="showPassw" onclick="showPassword(this,document.getElementById('passw'))"></i>
                            </div>

                            <p style='text-align:center;color:red;font-weight:bold'>${error}</p>
                            <div>
                                <label><input type="checkbox" name="tipoSesion"> Iniciar como personal sanitario</label>
                            </div>
                            <div class="group group-btn">
                                <input type="submit" name="menu" class="btn btn_submit" value="Iniciar sesion">
<!--                                <input type="button" name="menu" class=" btn btn_singup" value="Registrarse" 
                                       onclick="openForm()" >-->
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Popup-->
<!--        <div id="registro" class="modal">

            <form class="modal-content animate" action="RegistrarUsuario?accion=Registrarse" onsubmit="checkPassword()" method="post" >
                <div class="imgcontainer">
                    <span onclick="document.getElementById('registro').style.display = 'none'" class="close" title="Close Modal">&times;</span>

                </div>

                <div class="container">
                    <h2>Registro de usuario</h2><hr>
                    <label for="nombre"><b>Nombre completo</b></label>
                    <input type="text" class="r_input" placeholder="Nombre completo" name="nombre" required>

                    <label for="user"><b>Nombre de usuario</b></label>
                    <input type="text" class="r_input" placeholder="Nombre de usuario" name="user" required>

                    <label for="psw"><b>Contraseña</b></label>
                    <input type="password" class="r_input" placeholder="Contraseña" name="psw" required>

                    <label for="psw2"><b>Repite la contraseña</b></label>
                    <input type="password" class="r_input" placeholder="Contraseña" name="psw2" required>

                    <button type="submit" class="r_btn" name="accion">Registrarse</button>
                    <label>
                        <input type="checkbox" checked="checked" name="autolog"> Iniciar sesion automaticamente
                    </label>
                </div>
            </form>
        </div>-->
    <div class="modal" id="registro">

            <div class="form-popup animate">
                <form action="RegistrarUsuario" method="get" class="form-container" onsubmit="checkPassword()">
                    <h2>Formulario de registro</h2>
                    <fieldset>
                        <legend>Datos personales</legend>
                        <div class="f_row">
                            <div class="f_column">
                                <label>Nombre</label>
                                <input type="text" name="nombre" class="f_txt" placeholder="Nombre completo" required>
                            </div>
                            <div class="f_column">
                                <label>Edad</label>
                                <input type="number" name="edad" min="18" class="f_txt" placeholder="edad" required>
                            </div>

                        </div>
                        <div class="f_row">

                            <div class="f_column">
                                <label>Sexo</label>
                                <select name="sexo" class="f_txt esp" required>
                                    <option></option>
                                    <option>Hombre</option>
                                    <option>Mujer</option>
                                </select>
                            </div>

                            <div class="f_column">
                                <label>Documento</label>
                                <input type="text" name="doc" class="f_txt" placeholder="Nº DIP o pasaporte">
                            </div>
                        </div>
                        <div class="f_row">

                            <div class="f_column">
                                <label>Direccion</label>
                                <input type="text" name="dir" class="f_txt" placeholder="Direccion" required>
                            </div>

                            <div class="f_column">
                                <label>Telefono</label>
                                <input type="text" name="tel" class="f_txt" placeholder="Telefono">
                            </div>
                        </div>

                    </fieldset>

                    <fieldset>
                        <legend>Datos de usuario</legend>
                        <div class="f_row">
                            <div class="f_column">
                                <label>Usuario</label>
                                <input type="text" name="user" class="f_txt" placeholder="Nombre de usuario">
                            </div>
                            <div class="f_column">
                                <label>Contraseña</label>
                                <input type="password" name="psw" id="passw" class="f_txt" placeholder="Contraseña">
                            </div>
                        </div>

                        <div class="f_row">
                            <div class="f_column">
                                <label></label>
                                <input type="hidden" class="f_txt">
                            </div>
                            <div class="f_column">
                                <label>Repita la contraseña</label>
                                <input type="password" name="psw2" id="passw2" class="f_txt" placeholder="Contraseña">
                            </div>
                        </div>

                    </fieldset>

                    <div class="f_row">
                        <button type="submit" name="accion" class="btn_guardar">Guardar</button>
                    </div>

                </form>
                <span class="cancel" onclick="closeForm()" title="Cerrar el formulario">&times;</span>
            </div>

        </div>

<!--        <div class="footer">
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
        </div>-->

        <script src="recursos/js/login.js" type="text/javascript"></script>
    </body>
</html>
