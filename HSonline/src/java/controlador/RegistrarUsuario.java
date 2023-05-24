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
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author Skyroot
 */
public class RegistrarUsuario extends HttpServlet {
    Usuario usu = new Usuario();
    Paciente p = new Paciente();
    PacienteDAO pdao = new PacienteDAO();
    UsuarioDAO usudao = new UsuarioDAO();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Respuesta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Error! ya existe un usuario con el nombre introducido </h2>");
            out.println("<h3>Intenta probar con otro nombre</h3>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion != null) {

            String nombre = request.getParameter("nombre");
            String usuario = request.getParameter("user");
            String passw = request.getParameter("psw");
            
            int edad = Integer.parseInt(request.getParameter("edad"));
            String sexo = request.getParameter("sexo");
            String doc = request.getParameter("doc");
            String dir = request.getParameter("dir");
            String tel = request.getParameter("tel");

            

            if (pdao.existePaciente(doc)==false) {
                p.setNombre(nombre);
                p.setEdad(edad);
                p.setSexo(sexo);
                p.setDocumento(doc);
                p.setDireccion(dir);
                p.setTelefono(tel);
                p.setUsuario(usuario);
                p.setContrasena(passw);
                pdao.guardarPaciente2(p);
//                usu = usudao.registrarUsuario(new Usuario(nombre, usuario, passw));
//                    request.setAttribute("usuario", pdao.guardarPaciente2(p));
//                    request.getRequestDispatcher("Controlador?menu=Inicio&accion=login").forward(request, response);
                response.sendRedirect("Controlador?menu=Login&accion=registro&r=OK");
                
            }else{
//                request.setAttribute("error", "El usuario con el documento "+doc+" ya existe");
//                request.getRequestDispatcher("Controlador?menu=Login&").forward(request, response);
                response.sendRedirect("Controlador?menu=Login&accion=registro&r=error");
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
