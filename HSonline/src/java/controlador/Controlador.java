/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.CitaDAO;
import modelo.Consulta;
import modelo.ConsultaDAO;
import modelo.Estadistica;
import modelo.HC;
import modelo.HorarioDAO;
import modelo.Paciente;
import modelo.PacienteConsultaDAO;
import modelo.PacienteDAO;
import modelo.PruebasPaciente;
import modelo.SanitarioDAO;
import modelo.Usuario;

/**
 *
 * @author Skyroot
 */
public class Controlador extends HttpServlet {

    Paciente paciente = new Paciente();
    PacienteDAO pdao = new PacienteDAO();
    Consulta consulta = new Consulta();
    ConsultaDAO cdao = new ConsultaDAO();
    CitaDAO cita = new CitaDAO();
    SanitarioDAO sdao = new SanitarioDAO();
    Estadistica estadistica = new Estadistica();
    Usuario usu = new Usuario();
    PruebasPaciente pruebas = new PruebasPaciente();
    PacienteConsultaDAO pcdao = new PacienteConsultaDAO();
    HorarioDAO hdao = new HorarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //navegacion y acciones
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        //datos enviados para la busqueda
        String codPaciente = request.getParameter("codPaciente");
        String codConsulta = request.getParameter("codConsulta");
        //datos del usuario conectado
//        String nombre = request.getParameter("nombre");
//        String usuario = request.getParameter("user");
//        String codigo = request.getParameter("cod");
//        request.setAttribute("nombre", nombre);
//        request.setAttribute("usuario", usuario);

        int page = 1;
        int filasPorPagina = 10;
        String estado = "", alert = "";

        switch (menu) {
            case "Principal":

                usu = (Usuario) request.getAttribute("usuario");
                request.setAttribute("usuario", usu);
                request.setAttribute("citas", estadistica.getCitas());
                request.setAttribute("pacientes", estadistica.getPacientes());
                request.setAttribute("personal", estadistica.getPersonal());
                request.setAttribute("consultas", estadistica.getConsultas());
                request.setAttribute("tratamientos", estadistica.getTratamientos());
                request.setAttribute("hospitalizados", estadistica.getHospitalizados());
                request.setAttribute("hc", estadistica.getHc());
                request.setAttribute("lunes", hdao.lunes());
                request.setAttribute("martes", hdao.martes());
                request.setAttribute("miercoles", hdao.miercoles());
                request.setAttribute("jueves", hdao.jueves());
                request.setAttribute("viernes", hdao.viernes());
                request.setAttribute("sabado", hdao.sabado());
                request.setAttribute("domingo", hdao.domingo());
                request.getRequestDispatcher("vista/admin.jsp").forward(request, response);
                break;
            case "Inicio":
                if (accion.equals("sc")) {
                    String resp = request.getParameter("r");
                    if (resp.equals("OK")) {
                        request.setAttribute("respuesta", "<h3 style='color:green'>Se ha enviado tu solicitud de cita</h3>");
                        System.out.println("Solicitud enviada");
                    } else {
                        request.setAttribute("respuesta", "<h3 style='color:red'>Error al enviar solicitud de cita</h3>");
                    }
                    request.getRequestDispatcher("vista/principal2.jsp").forward(request, response);
                }

                if (accion.equals("login")) {

                    request.getRequestDispatcher("vista/principal2.jsp").forward(request, response);
                }
                request.getRequestDispatcher("vista/principal2.jsp").forward(request, response);
                break;
            case "Interconsulta":
                if (accion.equalsIgnoreCase("Registro")) {
                    request.getRequestDispatcher("vista/interconsulta_registro.jsp").forward(request, response);
                }
                break;
//            case "ActualizarConsulta":
//                if (accion.equalsIgnoreCase("Buscar")) {
//                    request.setAttribute("datos", pcdao.datosPacienteConsulta(Integer.parseInt(codPaciente), Integer.parseInt(codConsulta)));
//                    request.setAttribute("pruebas", cdao.listarPruebasOrdenadas(codConsulta));
//                    request.setAttribute("tratamientos", cdao.listarTratamientos());
//                    request.getRequestDispatcher("vista/interconsulta_actualizar.jsp").forward(request, response);
//                }
//                if (accion.equalsIgnoreCase("Mostrar")) {
//                    request.getRequestDispatcher("vista/interconsulta_actualizar.jsp").forward(request, response);
//                }
//                break;
            case "Consultas":

                if (accion.equalsIgnoreCase("Listar")) {
//                    String filtro = request.getParameter("filtro");
                    if (request.getParameter("page") != null) {

                        if (request.getParameter("r") != null) {
                            String resp = request.getParameter("r");
                            if (resp.equals("OK")) {
                                page = Integer.parseInt(request.getParameter("page"));
                                List<Consulta> consultas = cdao.listarConsultas((page - 1) * filasPorPagina, filasPorPagina);
                                int noFilas = cdao.getNumeroFilas();
                                int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                                request.setAttribute("consultas", consultas);
                                request.setAttribute("noPag", noPaginas);
                                request.setAttribute("pagActual", page);
                                request.setAttribute("noFilas", noFilas);
//                        request.setAttribute("pruebas", cdao.pruebasOrdenadas());
                                request.setAttribute("estado", "<h3 style='color:green'>Lista de consultas</h3>");
                                estado = "Datos guardados con exito";
                                alert = "<div class='alert alert-success animate'>"
                                        + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                        + "<p><strong>Info!</strong> " + estado + "</p>"
                                        + "</div>";
                                request.setAttribute("alert", alert);
                            }
                        } else {
                            page = Integer.parseInt(request.getParameter("page"));
                            List<Consulta> consultas = cdao.listarConsultas((page - 1) * filasPorPagina, filasPorPagina);
                            int noFilas = cdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("consultas", consultas);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
//                        request.setAttribute("pruebas", cdao.pruebasOrdenadas());
                            request.setAttribute("estado", "<h3 style='color:green'>Lista de consultas</h3>");
                        }
                    }
                    request.getRequestDispatcher("vista/resultados.jsp").forward(request, response);
                }
                if (accion.equalsIgnoreCase("Archivar")) {
                    page = Integer.parseInt(request.getParameter("page"));
                    int num = Integer.parseInt(request.getParameter("num"));
                    if (request.getParameter("r").equals("OK")) {
                        estado = num + " consultas archivadas!";
                        alert = "<div class='alert alert-success animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + estado + "</p>"
                                + "</div>";
//                    cdao.eliminarConsulta(Integer.parseInt(cod));
                        List consultas = cdao.listarConsultas((page - 1) * filasPorPagina, filasPorPagina);
                        request.setAttribute("consultas", consultas);
                        int noFilas = cdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='color:green'>Lista de consultas</h3>");
                        request.setAttribute("alert", alert);
                        request.getRequestDispatcher("vista/resultados.jsp").forward(request, response);
                    }

                }
//                if (accion.equalsIgnoreCase("Busqueda")) {
//                    String datos = request.getParameter("datos");
//                    //eliminar consulta
//                    List consultas = pcdao.buscarPacienteConsulta(datos);
//                    request.setAttribute("consultas", consultas);
//                    request.getRequestDispatcher("vista/resultados.jsp").forward(request, response);
//                }
//

                break;
            case "Pacientes":

                if (accion.equalsIgnoreCase("Listar")) {

                    if (request.getParameter("page") != null) {
                        page = Integer.parseInt(request.getParameter("page"));
                        if (request.getParameter("r") != null) {
                            if (request.getParameter("r").equals("OK")) {
                                estado = "Datos guardados con exito";
                                alert = "<div class='alert alert-success animate'>"
                                        + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                        + "<p><strong>Info!</strong> " + estado + "</p>"
                                        + "</div>";

                                List<Paciente> listaPacientes = pdao.listarPacientes((page - 1) * filasPorPagina, filasPorPagina);
                                int noFilas = pdao.getNumeroFilas();
                                int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                                request.setAttribute("p", listaPacientes);
                                request.setAttribute("noPag", noPaginas);
                                request.setAttribute("pagActual", page);
                                request.setAttribute("noFilas", noFilas);
                                request.setAttribute("estado", "<h3 style='color:green'>Lista de pacientes</h3>");
                                request.setAttribute("alert", alert);
                            } else {
//                                estado = "Error al registrar paciente, ya existe";
                                estado = request.getParameter("r");
                                alert = "<div class='alert alert-warning animate'>"
                                        + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                        + "<p><strong>Error!</strong> " + estado + "</p>"
                                        + "</div>";
//                                page = Integer.parseInt(request.getParameter("page"));
                                List<Paciente> listaPacientes = pdao.listarPacientes((page - 1) * filasPorPagina, filasPorPagina);
                                int noFilas = pdao.getNumeroFilas();
                                int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                                request.setAttribute("p", listaPacientes);
                                request.setAttribute("noPag", noPaginas);
                                request.setAttribute("pagActual", page);
                                request.setAttribute("noFilas", noFilas);
                                request.setAttribute("estado", "<h3 style='color:green'>Lista de pacientes</h3>");
                                request.setAttribute("alert", alert);
                            }
                        } else {

                            List<Paciente> listaPacientes = pdao.listarPacientes((page - 1) * filasPorPagina, filasPorPagina);
                            int noFilas = pdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("p", listaPacientes);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                            request.setAttribute("estado", "<h3 style='color:green'>Lista de pacientes</h3>");

                        }

                    }
                    request.getRequestDispatcher("vista/pacientes.jsp").forward(request, response);
                }
                if (accion.equalsIgnoreCase("nc")) {
//                    int cod = Integer.parseInt(request.getParameter("codPaciente"));
                    String id = request.getParameter("id");

                    request.setAttribute("paciente", pdao.buscarPaciente(id));
                    request.getRequestDispatcher("vista/interconsulta_consulta.jsp").forward(request, response);
                }
                if (accion.equals("Buscar")) {
                    request.setAttribute("p", pdao.buscarPaciente(request.getParameter("txtBuscar")));
                    request.getRequestDispatcher("vista/pacientes.jsp").forward(request, response);
                }
                if (accion.equalsIgnoreCase("edit")) {
                    String id = request.getParameter("id");

                    request.setAttribute("paciente", pdao.buscarPaciente(id));
                    request.getRequestDispatcher("vista/interconsulta_registro.jsp").forward(request, response);
                }

                break;
            case "Detalles":
                String codMed = request.getParameter("mId");
                if (accion.equalsIgnoreCase("Mostrar")) {
                    request.setAttribute("datos", pcdao.datosPacienteConsulta(Integer.parseInt(codPaciente), Integer.parseInt(codConsulta)));
                    request.setAttribute("sanitario", sdao.getSanitario(codMed));
                    request.setAttribute("prescripciones", pcdao.listarPrescripciones(Integer.parseInt(codConsulta)));
                    request.getRequestDispatcher("vista/detalles_interconsulta.jsp").forward(request, response);
                }

                break;
            case "Perfil":
                if (accion.equals("user_perfil")) {
                    if (request.getParameter("act").equals("ver")) {
                        request.getRequestDispatcher("vista/perfil.jsp").forward(request, response);
                    }
                    if (request.getParameter("act").equals("actualizar") && request.getParameter("r").equals("OK")) {
                        estado = "<h3 style='color:green'>Datos actualizados con exito!</h3>";

                        request.setAttribute("respuesta", estado);
                        request.getRequestDispatcher("vista/principal2.jsp").forward(request, response);
                    } else {
                        estado = "<h3 style='color:green'>No se pudo actualizar los datos</h3>";

                        request.setAttribute("respuesta", estado);
                        request.getRequestDispatcher("vista/principal2.jsp").forward(request, response);
                    }

                }
                if (accion.equals("citas")) {
                    String id = request.getParameter("id");
                    String doc = request.getParameter("doc");
                    if (request.getParameter("page") != null) {
                        page = Integer.parseInt(request.getParameter("page"));
                        List citas = cita.listarCitasPaciente(doc);
                        List datos = cdao.listarConsultasPaciente((page - 1) * filasPorPagina, filasPorPagina, id);
                        int noFilas = cdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("consultas", datos);
                        request.setAttribute("citas", citas);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                    request.getRequestDispatcher("vista/miscitas.jsp").forward(request, response);
                    }
                }
                if (accion.equals("perfil")) {

                    request.getRequestDispatcher("vista/perfil2.jsp").forward(request, response);
                }
                if (accion.equals("edt")) {
                    String resp = request.getParameter("r");
                    if (resp.equals("OK")) {
                        estado = "Datos actualizados con exito!";
                        alert = "<div class='alert alert-success animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                        request.getRequestDispatcher("vista/perfil2.jsp").forward(request, response);
                    } else {
                        estado = "No se pudo actualizar los datos";
                        alert = "<div class='alert alert-warning animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Error!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                        request.getRequestDispatcher("vista/perfil2.jsp").forward(request, response);
                    }

                }
                if (accion.equals("editAdmin")) {
                    String resp = request.getParameter("r");
                    if (resp.equals("OK")) {
                        estado = "Datos actualizados con exito!";
                        alert = "<div class='alert alert-success animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                    } else {
                        estado = "No se pudo actualizar los datos";
                        alert = "<div class='alert alert-warning animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Error!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                    }
                    request.getRequestDispatcher("vista/perfil3.jsp").forward(request, response);
                }

                break;

            case "index":
                request.getRequestDispatcher("/").forward(request, response);
                break;
            case "Login":
//                String acc = request.getParameter("accion");
                if (accion.equals("registro")) {
                    String resp = request.getParameter("r");
                    if (resp.equals("OK")) {

                        request.setAttribute("respuesta", "<h3 style='color:green'>El usuario ya esta registrado. Ya puedes acceder!</h3>");
                    } else {
                        request.setAttribute("respuesta", "<h3 style='color:red'>El usuario ya esta registrado</h3>");

                    }
                }

                if (accion.equals("logerr")) {
                    request.setAttribute("error", "<h3 style='color:red'>Usuario o contraseña no válido.</h3>");
                }
                if (accion.equals("0")) {

                }

                request.getRequestDispatcher("vista/login.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("vista/error.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
