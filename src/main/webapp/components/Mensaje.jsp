<%-- 
    Document   : Mensaje
    Created on : 29 oct 2024, 23:29:29
    Author     : ENOC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.success != null}">
    <script>
        Swal.fire({
            title: "¡Éxito!",
            text: "${sessionScope.success}",
            icon: "success"
        });
    </script>
</c:if>

<c:if test="${sessionScope.error != null}">
    <script>
        Swal.fire({
            title: "¡Advertencia!",
            text: "${sessionScope.error}",
            icon: "error"
        });
    </script>
</c:if>
<c:remove var="success" scope="session" />
<c:remove var="error" scope="session" />