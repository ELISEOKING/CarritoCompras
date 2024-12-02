package com.edu.pe.Modelo;

public class DetallePedido {

    private Producto producto;
    private int cantidad;

    public void AumentarCantidad(int cantidad) {
        if (this.cantidad + cantidad > 0) {
            this.cantidad += cantidad;
        }
    }

    public double Importe() {
        return producto.getPrecio() * cantidad;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
