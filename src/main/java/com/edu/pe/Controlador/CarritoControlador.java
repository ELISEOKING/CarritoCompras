package com.edu.pe.Controlador;

import com.edu.pe.Modelo.DAO.ProductoDAO;
import com.edu.pe.Modelo.DetallePedido;
import com.edu.pe.Modelo.Producto;
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
public class CarritoControlador extends HttpServlet {

    private String PagListarCarrito = "PagCarrito.jsp";
    private String PagInicio = "index.jsp";

    private ProductoDAO prodDAO = new ProductoDAO();
    private Carrito objCarrito = new Carrito();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                Listar(request, response);
                break;
            case "agregar":
                Agregar(request, response);
                break;
            case "eliminar":
                Eliminar(request, response);
                break;
            case "aumentar":
                Aumentar(request, response);
                break;
            case "disminuir":
                Disminuir(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void Listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<DetallePedido> lista = objCarrito.ObtenerSesion(request);
        request.setAttribute("carrito", lista);
        request.setAttribute("total", objCarrito.ImporteTotal(lista));
        request.getRequestDispatcher(PagListarCarrito).forward(request, response);
    }

    protected void Agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProd = Integer.parseInt(request.getParameter("id"));
        Producto obj = prodDAO.BuscarPorId(idProd);

        if (obj != null) {
            DetallePedido objDet = new DetallePedido();
            objDet.setProducto(obj);
            objDet.setCantidad(1);

            objCarrito.AgregarCarrito(objDet, request);
        }
        request.getRequestDispatcher(PagInicio).forward(request, response);
    }

    protected void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int indice = Integer.parseInt(request.getParameter("indice"));
        objCarrito.RemoverItemCarrito(request, indice);
        response.sendRedirect("CarritoControlador?accion=listar");
    }

    protected void Aumentar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int indice = Integer.parseInt(request.getParameter("indice"));

        // Incrementar cantidad del ítem en el carrito
        ArrayList<DetallePedido> carrito = objCarrito.ObtenerSesion(request);
        if (indice >= 0 && indice < carrito.size()) {
            DetallePedido item = carrito.get(indice);
            item.setCantidad(item.getCantidad() + 1); // Incrementar cantidad
        }

        // Actualizar la sesión
        objCarrito.ActualizarSesion(request, carrito);

        // Redirigir a la página del carrito
        response.sendRedirect("CarritoControlador?accion=listar");
    }

    protected void Disminuir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int indice = Integer.parseInt(request.getParameter("indice"));

        // Decrementar cantidad del ítem en el carrito
        ArrayList<DetallePedido> carrito = objCarrito.ObtenerSesion(request);
        if (indice >= 0 && indice < carrito.size()) {
            DetallePedido item = carrito.get(indice);
            if (item.getCantidad() > 1) {
                item.setCantidad(item.getCantidad() - 1); // Decrementar cantidad
            } else {
                carrito.remove(indice); // Si la cantidad llega a 0, eliminar el producto del carrito
            }
        }

        // Actualizar la sesión
        objCarrito.ActualizarSesion(request, carrito);

        // Redirigir a la página del carrito
        response.sendRedirect("CarritoControlador?accion=listar");
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
