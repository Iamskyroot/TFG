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
import modelo.Paciente;
import modelo.PacienteDAO;

/**
 *
 * @author Skyroot
 */
public class PerfilPaciente extends HttpServlet {

    PacienteDAO pdao = new PacienteDAO();
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PerfilPaciente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PerfilPaciente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getParameter("accion") != null) {
            String nombre = request.getParameter("nombre");
            String sexo = request.getParameter("sexo");
            String edad = request.getParameter("edad");
            String documento = request.getParameter("doc");
            String dir = request.getParameter("dir");
            String tel = request.getParameter("tel");
            String usuario = request.getParameter("user");
            String contrasena = request.getParameter("psw");

            Paciente p = new Paciente();
            p.setNombre(nombre);
            p.setSexo(sexo);
            p.setEdad(Integer.parseInt(edad));
            p.setDocumento(documento);
            p.setDireccion(dir);
            p.setTelefono(tel);
            p.setUsuario(usuario);
            p.setContrasena(contrasena);
            if (pdao.actualizarPaciente(p)) {
                response.sendRedirect("Controlador?menu=Perfil&accion=user_perfil&act=actualizar&r=OK");
            } else {
                response.sendRedirect("Controlador?menu=Perfil&accion=user_perfil&act=actualizar&r=error");
            }
        }else{
            response.sendRedirect("Controlador?menu=Perfil&accion=user_perfil&act=actualizar&r=error");
        }
        
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
