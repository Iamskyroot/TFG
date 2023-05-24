package org.apache.jsp.vista;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class miscitas_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/vista/no_session.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"ISO-8859-1\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Hospital de sampaka -> principal</title>\r\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/recursos/css/bootstrap.min.css\"/>-->\r\n");
      out.write("        <link href=\"");
      out.print(request.getContextPath());
      out.write("/recursos/css/header.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <link href=\"");
      out.print( request.getContextPath());
      out.write("/recursos/css/miscitas.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <link href=\"");
      out.print( request.getContextPath());
      out.write("/assets/css/all.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      out.write('\n');
      out.write('\n');

    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("Controlador?menu=Login&accion=0");
    }

      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <ul class=\"navegacion\" id=\"navegacion\">\r\n");
      out.write("            <div class=\"n_item logo\">\r\n");
      out.write("                <a href=\"#\" class=\"icon\">HS</a>\r\n");
      out.write("                <a href=\"#\">online</a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"n_item enlaces\"><a href=\"Controlador?menu=Inicio&accion=\">Principal</a></li>\r\n");
      out.write("            <li class=\"n_item enlaces active\"><a href=\"#\">Mis citas</a></li>\r\n");
      out.write("            <li class=\"n_item enlaces\"><a href=\"#\">Contacto</a></li>\r\n");
      out.write("            <div class=\"n_item dropdown\">\r\n");
      out.write("                <button class=\"dropbtn\">\r\n");
      out.write("                    <i class=\"fas fa-user-circle\" style=\"font-size: 24px\"></i>\r\n");
      out.write("                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${usuario.getNombre()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("                    <i class=\"fas fa-caret-down\"></i>\r\n");
      out.write("                </button>\r\n");
      out.write("                <div class=\"dropdown-content\">\r\n");
      out.write("                    <div class=\"user-icon\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${letra}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</div>\r\n");
      out.write("                    <div class=\"user-item\"><span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${usuario.getNombre()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></div>\r\n");
      out.write("                    <a href=\"#\" onclick=\"mostrarConfirmacionCita(");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${usuario.getDocumento()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(", document.getElementById('callout'))\">Siguiente cita</a>\r\n");
      out.write("                    <a href=\"Controlador?menu=Perfil&accion=user_perfil&act=ver\" >Mi perfil</a>\r\n");
      out.write("                    <a href=\"CerrarSesion?accion=logout\">Cerrar sesion</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <li class=\"btn_menu\"><a href=\"javascript:void(0);\" onclick=\"menuResponsive()\">\r\n");
      out.write("                    <div class=\"open\" id=\"open\" title=\"Abrir menu\">\r\n");
      out.write("                        <div class=\"m\"></div>\r\n");
      out.write("                        <div class=\"m\"></div>\r\n");
      out.write("                        <div class=\"m\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"close\" id=\"close\" title=\"Cerrar menu\">&times;</div>\r\n");
      out.write("                </a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"main_container\">\r\n");
      out.write("            <div class=\"table-responsive\">\r\n");
      out.write("                <table class=\"table table-hover table-striped \" id=\"tab2\">\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <!--<td></td>-->\r\n");
      out.write("                            <td>ID</td>\r\n");
      out.write("                            <td>motivo</td>\r\n");
      out.write("                            <td>fecha</td>\r\n");
      out.write("                            <td>Acciones</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    <tbody id=\"res\">\r\n");
      out.write("                    <c:forEach  items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" var=\"consultas\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <!--<td></td>-->\r\n");
      out.write("                            <td>ID</td>\r\n");
      out.write("                            <td>jsjdk</td>\r\n");
      out.write("                            <td>fecha</td>\r\n");
      out.write("                            <td></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <!--<td><input type=\"checkbox\" name=\"codConsulta\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getCodigo()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"></td>-->\r\n");
      out.write("                            <td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getCodigo()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("                            \r\n");
      out.write("                            <td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getFecha_consulta()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("                            <td class=\"btn-group-sm\">\r\n");
      out.write("                                <a class=\"btn btn-success\" href=\"#\" onclick=\"editConsulta(");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getPaciente_id()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(',');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getCodigo()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(")\" title=\"Editar\"><i class=\"far fa-edit\"></i></a>\r\n");
      out.write("                                <a class=\"btn btn-warning\" href=\"archivar?menu=Consultas&accion=Archivar&codConsulta=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getCodigo()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("&codPaciente=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getPaciente_id()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("&mId=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getMedico_id()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pagActual}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" title=\"Archivar\"><i style=\"color:white\" class=\"fas fa-download\"></i></a>\r\n");
      out.write("                                <a class=\"btn btn-info\" href=\"Controlador?menu=Detalles&accion=Mostrar&codPaciente=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getPaciente_id()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("&codConsulta=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getCodigo()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("&mId=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${consultas.getMedico_id()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" target=\"blank\" title=\"Mostrar detalles\"><i class=\"far fa-address-card\"></i></a>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </c:forEach>\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"paginacion\">\r\n");
      out.write("                    <!--display previous link except for the first page-->\r\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pagActual != 1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                        <a href=\"Controlador?menu=Consultas&accion=Listar&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pagActual - 1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><i class=\"fas fa-angle-double-left\"></i></a>\r\n");
      out.write("                    </c:if>\r\n");
      out.write("                    <!--displaying page numbers-->\r\n");
      out.write("                    <c:forEach begin=\"1\" end=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${noPag}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" var=\"i\">\r\n");
      out.write("                        <c:choose>\r\n");
      out.write("                            <c:when test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pagActual eq i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                                <a href=\"Controlador?menu=Consultas&accion=Listar&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" class=\"active\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</a>\r\n");
      out.write("                            </c:when>\r\n");
      out.write("                            <c:otherwise>\r\n");
      out.write("                                <a href=\"Controlador?menu=Consultas&accion=Listar&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write('"');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</a>\r\n");
      out.write("                            </c:otherwise>\r\n");
      out.write("                        </c:choose>\r\n");
      out.write("                    </c:forEach>\r\n");
      out.write("                    <!--display previous link except for the first page-->\r\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pagActual lt noPag}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                        <a href=\"Controlador?menu=Consultas&accion=Listar&page=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pagActual + 1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"><i class=\"fas fa-angle-double-right\"></i></a>\r\n");
      out.write("                    </c:if>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <label style=\"float: right;font-weight: bold;margin-right: 10px\">Total: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${noFilas}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</label>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("                <div class=\"aside\">\r\n");
      out.write("                    <p>Contenedor de citas</p>\r\n");
      out.write("                </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            <div class=\"f_item\">\r\n");
      out.write("                <h4>informacion de contacto</h4>\r\n");
      out.write("                <p>Direccion: <strong>Sampaka - al lado del Hospital Psiquiatrico</strong></p>\r\n");
      out.write("                <p>Telefono: <strong>222 345 562/333 356 246</strong></p>\r\n");
      out.write("                Email: <a>hsonlinegq@gmail.com</a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"f_item\">\r\n");
      out.write("                <h4>Nuestros servicios</h4>\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li>Consultas</li>\r\n");
      out.write("                    <li>Hospitalizacion</li>\r\n");
      out.write("                    <li>Urgencias</li>\r\n");
      out.write("                    <li>Dianostico por imagen</li>\r\n");
      out.write("                    <li>UCI</li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"f_item\">\r\n");
      out.write("                <h4>Politica de privacidad</h4>\r\n");
      out.write("                <p>TFG UNGE &copy;2022 Derechos reservados</p>\r\n");
      out.write("                <p>Autores: <b>Valentin E. Angono</b> y <b>Javier Clemente Mangue</b></p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            // Get the modal\r\n");
      out.write("            var modal = document.getElementById('registro');\r\n");
      out.write("\r\n");
      out.write("            // When the user clicks anywhere outside of the modal, close it\r\n");
      out.write("            window.onclick = function (event) {\r\n");
      out.write("                if (event.target === modal) {\r\n");
      out.write("                    modal.style.display = \"none\";\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("            //close form\r\n");
      out.write("            function closeForm() {\r\n");
      out.write("                document.getElementById(\"modal\").style.display = \"none\";\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("        <script src=\"");
      out.print( request.getContextPath());
      out.write("/recursos/js/jquery-3.6.4.min.js\"></script>\r\n");
      out.write("        <script src=\"");
      out.print( request.getContextPath());
      out.write("/recursos/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"");
      out.print( request.getContextPath());
      out.write("/recursos/js/admin_panel.js\"></script>\r\n");
      out.write("        <script src=\"");
      out.print( request.getContextPath());
      out.write("/recursos/js/header.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"");
      out.print( request.getContextPath());
      out.write("/recursos/js/mod_cita.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
