<%-- 
    Document   : PagMisPedidos
    Created on : 7 nov 2024, 0:36:49
    Author     : ENOC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Mis Pedidos</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="assets/css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp"/>
        <jsp:include page="components/Mensaje.jsp"/>
        <div class="container-fluid mt-2">
            <h5>Mis Pedidos</h5>
            <hr/>

            <div class="row">
                <!-- Sección del Carrito -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th># Pedido</th>
                                            <th>Fecha</th>
                                            <th>Total (s/)</th>
                                            <th>Estado</th>
                                            <th>Detalle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${pedidos}" var="item">
                                            <tr>
                                                <td>${item.idPedido}</td>
                                                <td>${item.fecha}</td>
                                                <td>${item.total}</td>
                                                <td>${item.estado}</td> 
                                                <td>
                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#ModalDetalle">
                                                        Ver
                                                    </button>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="ModalDetalle" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">PEDIDOS</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <table class="table table-bordered table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Imagen</th>
                                                                                <th>Producto</th>
                                                                                <th>Precio (s/)</th>
                                                                                <th>Cantidad</th>
                                                                                <th>Importe (s/)</th>
                                                                                <th>Acciones</th> <!-- Agrega esta columna para el botón de eliminar -->
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach items="${carrito}" var="item" varStatus="loop">
                                                                                <tr>
                                                                                    <td>
                                                                                        <img src="assets/img/productos/${item.producto.imagen}" width="50" height="60" alt="${item.producto.nombre}"/>
                                                                                    </td>
                                                                                    <td>${item.producto.nombre}</td>
                                                                                    <td>${item.producto.precio}</td>
                                                                                    <td>${item.cantidad}</td>
                                                                                    <td>${item.Importe()}</td>
                                                                                    <td>
                                                                                        <a href="CarritoControlador?accion=eliminar&indice=${loop.index}" title="Eliminar" class="btn btn-danger btn-sm">
                                                                                            <i class="fa fa-trash-alt"></i>
                                                                                        </a>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach> 
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div> 
                    </div>
                </div>
                <!-- Sección del Resumen de Compra -->

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
