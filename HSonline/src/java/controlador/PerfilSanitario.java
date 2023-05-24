/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Sanitario;
import modelo.SanitarioDAO;

/**
 *
 * @author Skyroot
 */
public class PerfilSanitario extends HttpServlet {

    SanitarioDAO sdao = new SanitarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("accion") != null) {

            String accion = request.getParameter("accion");

            String nombre = request.getParameter("nombre");
            String sexo = request.getParameter("sexo");
            String nacion = request.getParameter("nacion");
            String documento = request.getParameter("documento");
            String dir = request.getParameter("dir");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String especialidad = request.getParameter("espe");
            String usuario = request.getParameter("user");
            String contrasena = request.getParameter("psw");

            Sanitario s = new Sanitario();
            s.setNombre(nombre);
            s.setSexo(sexo);
            s.setNacion(nacion);
            s.setDocumento(documento);
            s.setDireccion(dir);
            s.setTelefono(tel);
            s.setEmail(email);
            s.setEspecialidad(especialidad);
            s.setUsuario(usuario);
            s.setContrasena(contrasena);
            if (sdao.actualizarSanitario(s)) {
                if (accion.equals("mperfil")) {

                    response.sendRedirect("Controlador?menu=Perfil&accion=edt&r=OK");
                } else {
                    response.sendRedirect("Controlador?menu=Perfil&accion=editAdmin&r=OK");
                }
            } else {
                response.sendRedirect("Controlador?menu=Perfil&accion=adit&r=error");
            }
        } else {
            response.sendRedirect("Controlador?menu=Perfil&accion=adit&r=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
