package com.edu.pe.Util;

import com.edu.pe.Modelo.DetallePedido;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Carrito {

    // Agrega un producto al carrito
    public void AgregarCarrito(DetallePedido detalle, HttpServletRequest request) {
        ArrayList<DetallePedido> lista = ObtenerSesion(request);
        int psc = ExisteProducto(lista, detalle.getProducto().getId_Prod());

        if (psc == -1) {
            lista.add(detalle);
        } else {
            DetallePedido objDet = lista.get(psc);
            objDet.AumentarCantidad(detalle.getCantidad());
            lista.set(psc, objDet);
        }

        GuardarSesion(request, lista); // Guarda la sesión actualizada
    }

    // Calcula el total del carrito
    public double ImporteTotal(ArrayList<DetallePedido> lista) {
        double total = 0;
        for (DetallePedido item : lista) {
            total += item.Importe();
        }
        return total;
    }

    // Remueve un producto del carrito
    public void RemoverItemCarrito(HttpServletRequest request, int indice) {
        ArrayList<DetallePedido> lista = ObtenerSesion(request);
        lista.remove(indice);
        GuardarSesion(request, lista); // Actualiza la sesión
    }

    // Obtiene el carrito de la sesión
    public ArrayList<DetallePedido> ObtenerSesion(HttpServletRequest request) {
        ArrayList<DetallePedido> lista;

        if (request.getSession().getAttribute("carrito") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<DetallePedido>) request.getSession().getAttribute("carrito");
        }

        return lista;
    }

    // Guarda o actualiza el carrito en la sesión
    public void GuardarSesion(HttpServletRequest request, ArrayList<DetallePedido> lista) {
        request.getSession().setAttribute("carrito", lista);
    }

    // Alias de GuardarSesion para mayor claridad (opcional)
    public void ActualizarSesion(HttpServletRequest request, ArrayList<DetallePedido> lista) {
        request.getSession().setAttribute("carrito", lista);
    }

    // Verifica si un producto ya está en el carrito
    public int ExisteProducto(ArrayList<DetallePedido> lista, int id_prod) {
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getProducto().getId_Prod() == id_prod) {
                return i;
            }
        }
        return -1; // Producto no encontrado
    }

}
