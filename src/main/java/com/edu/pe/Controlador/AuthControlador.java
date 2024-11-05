package com.edu.pe.Controlador;

import com.edu.pe.Modelo.Cliente;
import com.edu.pe.Modelo.DAO.AuthDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ENOC
 */
public class AuthControlador extends HttpServlet {

    private AuthDAO authdao = new AuthDAO();
    private final String pagLogin = "PagLogin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        switch (accion) {
            case "login":
                Login(request, response);
                break;
            case "autentificarse":
                Autentificarse(request, response);
                break;
            case "logout":
                Logout(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(pagLogin).forward(request, response);
    }

    protected void Autentificarse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        Cliente obj = authdao.Login(correo, password);

        if (obj != null) {
            request.getSession().setAttribute("usuario", obj);
            response.sendRedirect("index.jsp");
        } else {
            request.getSession().setAttribute("error", "Correo y/o contraseña incorrecto!");
            request.getRequestDispatcher(pagLogin).forward(request, response);
        }

    }

    protected void Logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().removeAttribute("usuario");
        response.sendRedirect("index.jsp");
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
