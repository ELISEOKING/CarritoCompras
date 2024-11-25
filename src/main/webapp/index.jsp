<%-- 
    Document   : index
    Created on : 2 oct 2024, 16:51:55
    Author     : ENOC ELISEO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Catálogo</title>
        <style>
            .product-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .product-card:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp"/>

        <div class="container-fluid mt-2">
            <h5>Catálogo de productos</h5>
            <hr/>

            <div class="row">
                <c:forEach items="${productos}" var="item">
                    <div class="col-sm-3 mt-1">
                        <form action="CarritoControlador" method="get">
                            <div class="card product-card"> <!-- Agregada la clase 'product-card' -->
                                <img src="assets/img/productos/${item.imagen}" width="100%" alt="${item.nombre}"/>
                                <div class="card-body">
                                    <p class="fw-bold">${item.nombre}</p>
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="${item.id_Prod}">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            <i class="fa fa-shopping-cart"></i> Agregar al carrito
                                        </button>
                                        <small class="fw-bold">$/${item.precio}</small>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>

        </div>

        <!-- Pie de página -->
        <footer class="text-center text-lg-start bg-dark text-white mt-5">
            <!-- Sección de redes sociales -->
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                <div class="me-5 d-none d-lg-block">
                    <span>Conéctate con nosotros en nuestras redes sociales:</span>
                </div>
                <div>
                    <a href="https://www.facebook.com/3L1S30.KING" class="me-4 text-reset"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://x.com/CoriVill8878" class="me-4 text-reset"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.google.com.pe/" class="me-4 text-reset"><i class="fab fa-google"></i></a>
                    <a href="https://www.instagram.com/theking_eliseo/" class="me-4 text-reset"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/h3noc-3lis3o-the-king/" class="me-4 text-reset"><i class="fab fa-linkedin"></i></a>
                    <a href="https://github.com/ELISEOKING" class="me-4 text-reset"><i class="fab fa-github"></i></a>
                </div>
            </section>
            <!-- Sección de enlaces -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                <i class="fas fa-gem me-3"></i>Nombre de tu tienda
                            </h6>
                            <p>Descubre la tecnología que necesitas al mejor precio. Desde laptops de última generación hasta tablets versátiles, nuestra tienda ofrece productos de alta calidad y la mejor experiencia de compra para que encuentres justo lo que buscas.</p>
                        </div>
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Productos</h6>
                            <p><a href="#!" class="text-reset">Electrónicos</a></p>
                            <p><a href="#!" class="text-reset">Moda</a></p>
                            <p><a href="#!" class="text-reset">Accesorios</a></p>
                            <p><a href="#!" class="text-reset">Deportes</a></p>
                        </div>
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Enlaces útiles</h6>
                            <p><a href="#!" class="text-reset">Precios</a></p>
                            <p><a href="#!" class="text-reset">Configuración</a></p>
                            <p><a href="#!" class="text-reset">Pedidos</a></p>
                            <p><a href="#!" class="text-reset">Ayuda</a></p>
                        </div>
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Contacto</h6>
                            <p><i class="fas fa-home me-3"></i> Lima, Perú</p>
                            <p><i class="fas fa-envelope me-3"></i> info@tutienda.com</p>
                            <p><i class="fas fa-phone me-3"></i> + 51 901 942 954</p>
                            <p><i class="fas fa-print me-3"></i> + 51 234 567 89</p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2024 Copyright:
                <a class="text-reset fw-bold" href="#">tutienda.com</a>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
