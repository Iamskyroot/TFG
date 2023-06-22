
package controlador;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Consulta;
import modelo.ConsultaDAO;
import modelo.Hospitalizacion;
import modelo.HospitalizacionDAO;
import modelo.PacienteDAO;
import modelo.Sanitario;

/**
 *
 * @author Skyroot
 */
public class RegistrarDianostico extends HttpServlet {

    ConsultaDAO cdao = new ConsultaDAO();
    Sanitario sanitario = new Sanitario();
    PacienteDAO pdao = new PacienteDAO();
    HospitalizacionDAO hospi = new HospitalizacionDAO();
    Consulta c = new Consulta();
    String estado = "", resp = "", alert = "";

    public String fecha() {

        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
            sanitario = (Sanitario) session.getAttribute("usuario");
            String codConsulta = request.getParameter("codConsulta").trim();
            String codPaciente = request.getParameter("codPaciente").trim();

        if (request.getParameter("accion") != null) {

            if (request.getParameterValues("p") != null) {
                String datosDianosticos = "";
                String dianosticos[] = request.getParameterValues("p");
                for (String dianostico : dianosticos) {
                    datosDianosticos += dianostico + "+ \t";
                }
                c.setDianosticos(datosDianosticos);
                c.setCodigo(Integer.parseInt(codConsulta));
                c.setFecha_dianostico(fecha());
                cdao.actualizarDianostico(c);
                
            }

            if (request.getParameterValues("t") != null) {

                String tratamiento[] = request.getParameterValues("t");

                for (String trata : tratamiento) {
                    int idTrata = Integer.parseInt(trata);
                    cdao = new ConsultaDAO();
                    cdao.registrarTratamiento(Integer.parseInt(codConsulta), Integer.parseInt(codPaciente), idTrata);
                }
            } 
            
            //hospitalizando al paciente
            if (request.getParameter("hospitalizar") != null) {
//                int cPaciente = Integer.parseInt(request.getParameter("id"));
                String nombre = pdao.getNombre(Integer.parseInt(codPaciente));
                hospi.hospitalizarPaciente(Integer.parseInt(codPaciente), nombre, request.getParameter("hospitalizar"));

            }
//            request.getRequestDispatcher("Controlador?menu=Consultas&accion=Listar&page=1").forward(request, response);
              response.sendRedirect("Controlador?menu=Consultas&accion=Listar&r=OK&page=1");

        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}
