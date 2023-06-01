/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Paciente;
import modelo.PacienteDAO;
import modelo.Sanitario;
import modelo.SanitarioDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author Skyroot
 */
public class ValidarLogin extends HttpServlet {

    Usuario usu = new Usuario();
    UsuarioDAO usudao = new UsuarioDAO();
    Sanitario sanitario = new Sanitario();
    SanitarioDAO sdao = new SanitarioDAO();
    Paciente p = new Paciente();
    PacienteDAO pdao = new PacienteDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (sdao.conectar() != null) {

            HttpSession session = request.getSession(true);

            String usuario = request.getParameter("usuario");
            String passw = request.getParameter("passw");
            String accion = request.getParameter("menu");

            if (accion.equalsIgnoreCase("Iniciar sesion")) {
                if (request.getParameter("tipoSesion") != null) {
                    sanitario = sdao.validarSanitario(usuario, passw);
//                    String especialidad = sanitario.getEspecialidad();

                    if (sanitario.getUsuario() != null) {
//                        if (especialidad.equalsIgnoreCase("admin")) {
//                            response.sendRedirect("Controlador?menu=User&type=Admin");
//                        }
//                        if (especialidad.contains("Medico General")) {
//                            usu = (Usuario) request.getAttribute("usuario");
//                            request.setAttribute("usuario", usu);
//                            response.sendRedirect("Controlador?menu=User&type=enfermerx");
////                            request.getRequestDispatcher("vista/admin/doctor.jsp").forward(request, response);
//                        }
//                        if (especialidad.contains("Recepcionista")) {
//
//                        }
                        session.setAttribute("usuario", sanitario);
                        session.setAttribute("letra", sanitario.getNombre().charAt(0));
                        response.sendRedirect("Controlador?menu=Principal");
                    } else {
                        request.setAttribute("error", "Usuario o contraseña no válidos.");
//                        request.getRequestDispatcher("Controlador?menu=Login").forward(request, response);
                        response.sendRedirect("Controlador?menu=Login&accion=logerr");
                    }
                } else {
                    p = pdao.validarUsuario(usuario, passw);
//            request.setAttribute("usuario", usu);
                    if (p.getUsuario() != null) {
                        session.setAttribute("letra", p.getNombre().charAt(0));
                        session.setAttribute("usuario", p);
                        response.sendRedirect("Controlador?menu=Inicio&accion=login");

                    } else {
                        response.sendRedirect("Controlador?menu=Login&accion=logerr");
                    }
                }
            } else {
//            request.setAttribute("error", "Usuario o contraseña no válidos.");
//            request.getRequestDispatcher("Controlador?menu=Login").forward(request, response);
                response.sendRedirect("Controlador?menu=Login&accion=logerr");
            }

        } else {
            request.setAttribute("respuesta", "<h2 style='color:red'>Error al conectar con la base de datos. " + sdao.conectar() + " </h2>");
            request.getRequestDispatcher("/").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
