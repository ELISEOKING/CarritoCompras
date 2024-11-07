package com.edu.pe.Controlador;

import com.edu.pe.Modelo.Cliente;
import com.edu.pe.Modelo.DAO.PedidoDAO;
import com.edu.pe.Modelo.DetallePedido;
import com.edu.pe.Modelo.Pedido;
import com.edu.pe.Util.Carrito;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ENOC
 */
public class PedidoControlador extends HttpServlet {

    private PedidoDAO pedidoDao = new PedidoDAO();

    private Carrito objcarrito = new Carrito();
    private final String pagLogin = "PagLogin.jsp";
    private final String pagCarrito = "PagCarrito.jsp";
    private final String pagMisPedidos = "PagMisPedidos.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "procesar":
                Procesar(request, response);

                break;
            case "mis_pedidos":
                MisPedidos(request, response);
                break;

            default:
                throw new AssertionError();
        }
    }

    protected void MisPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getSession().getAttribute("usuario") != null) {
            Cliente objCli = (Cliente) request.getSession().getAttribute("usuario");

            ArrayList<Pedido> listaPed = pedidoDao.ListarPorIdCliente(objCli.getIdCliente());
            request.setAttribute("pedidos", listaPed);
            request.getRequestDispatcher(pagMisPedidos).forward(request, response);
        } else {
            request.getRequestDispatcher(pagLogin).forward(request, response);
        }
    }

    protected void Procesar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getSession().getAttribute("usuario") != null) {
            Pedido objPed = new Pedido();
            Cliente objCli = (Cliente) request.getSession().getAttribute("usuario");
            ArrayList<DetallePedido> lista = objcarrito.ObtenerSesion(request);
            double total = objcarrito.ImporteTotal(lista);

            objPed.setCliente(objCli);
            objPed.setDetalles(lista);
            objPed.setTotal(total);
            objPed.setEstado("Pendiente");

            int result = pedidoDao.GenerarPedido(objPed);

            if (result > 0) {
                objcarrito.GuardarSesion(request, new ArrayList<DetallePedido>());
                request.getSession().setAttribute("success", "Pedido procesado de forma correcta");
                response.sendRedirect("PedidoControlador?accion=mis_pedidos");
            } else {
                request.getSession().setAttribute("Error", "No se pudo procesar pedido");
                request.getRequestDispatcher(pagCarrito).forward(request, response);
            }

        } else {
            request.getSession().setAttribute("Error", "Debe autentificarse primero,"
                    + "antes de procesar su compra");
            request.getRequestDispatcher(pagLogin).forward(request, response);

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
