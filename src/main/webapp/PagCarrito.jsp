<%-- 
    Document   : PagCarrito
    Created on : 6 oct 2024, 1:57:21
    Author     : ENOC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Mi Carrito</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="assets/css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp"/>
        <jsp:include page="components/Mensaje.jsp"/>
        <div class="container-fluid mt-2">
            <h5>Mi Carrito</h5>
            <hr/>

            <div class="row">
                <!-- Sección del Carrito -->
                <div class="col-sm-9">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Imagen</th>
                                            <th>Producto</th>
                                            <th>Precio (s/)</th>
                                            <th>Cantidad</th>
                                            <th>Importe (s/)</th>
                                            <th>Acción</th>
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
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <!-- Botón para disminuir cantidad -->
                                                        <a href="CarritoControlador?accion=disminuir&indice=${loop.index}" 
                                                           class="btn btn-outline-secondary btn-sm me-1" title="Disminuir">
                                                            <i class="fa fa-minus"></i>
                                                        </a>
                                                        <!-- Cantidad -->
                                                        <span>${item.cantidad}</span>
                                                        <!-- Botón para aumentar cantidad -->
                                                        <a href="CarritoControlador?accion=aumentar&indice=${loop.index}" 
                                                           class="btn btn-outline-secondary btn-sm ms-1" title="Aumentar">
                                                            <i class="fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                                <td>${item.Importe()}</td>
                                                <td>
                                                    <a href="CarritoControlador?accion=eliminar&indice=${loop.index}" title="Eliminar" class="btn btn-danger btn-sm">
                                                        <i class="fa fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${!(carrito != null && carrito.size() > 0)}">
                                            <tr class="text-center">
                                                <td colspan="6">Carrito Vacío!</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
                    </div>
                </div>
                <!-- Sección del Resumen de Compra -->
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <form action="PedidoControlador" method="post">
                                <div class="row">
                                    <h5>RESUMEN COMPRA</h5>
                                    <hr />
                                    <p>Total: S/ ${total}</p> <!-- Asegúrate de calcular e incluir el total -->
                                    <input type="hidden" name="accion" value="procesar">
                                    <button ${carrito.size() == 0 ? 'disabled': ''} type="submit" class="btn btn-warning btn-block btn-lg">
                                        <div class="d-flex justify-content-between">
                                            <span><i class="fa fa-credit-card"></i> PROCESAR</span>
                                        </div>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
