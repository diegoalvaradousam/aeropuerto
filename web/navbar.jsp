<%-- 
    Document   : navbar
    Created on : 11-15-2021, 09:04:27 PM
    Author     : jorgi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--  <%@page  session="true" %>

<%
    HttpSession sesion = request.getSession();
    String usuario;
   
    
if(session.getAttribute("usuario")!= null){
    usuario = session.getAttribute("usuario").toString();
    
}else{
    request.getRequestDispatcher("/index.jsp").forward(request, response);
}

                    

    %> --%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link href="https://fonts.googleapis.com/icon?fa Fmily=Material+Icons" rel="stylesheet"><!-- comment -->
        <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
        <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
        <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper">
                <a href="${pageContext.request.contextPath}/home.jsp" class="brand-logo center">AEROMAN</a>
                
                <ul id="nav-mobile" class="left">
                    <li><a href="#" id="itemMenu"><i class="material-icons">menu</i></a></li>
                </ul>
                   <ul id="nav-mobile" class="right">
                    <li><a href="#" id="itemMenu">Bienvenido <%=session.getAttribute("usuario").toString()%>!</a></li>
                    <li><a href="${pageContext.request.contextPath}/clientes?action=logout" id="itemMenu">Cerrar Sesion</a></li>
                </ul>
            </div>
        </nav>
        <ul id="slide-out" class="sidenav">
            <li><div class="user-view">
                    <div class="background">
                        <img src="${pageContext.request.contextPath}/imagen/table.jpg">
                    </div>
                    <a href="#user"><img class="circle" src="${pageContext.request.contextPath}/imagen/plane_travel.png"></a>
                    <a href="#name"><span class="white-text name">Hola <%=session.getAttribute("usuario").toString()%></span></a><br>
                    <!--<a href="#email"><span class="white-text email">jdandturk@gmail.com</span></a>-->
                </div></li>
                <li><a href="${pageContext.request.contextPath}/clientes?action=mostrar">Clientes</a></li>            
                <li><a href="${pageContext.request.contextPath}/tarjeta?action=mostrar">Tarjeta de embarque</a></li>            
                <li><a href="${pageContext.request.contextPath}/reserva?action=mostrar">Reservas de vuelo</a></li>            
                <li><a href="${pageContext.request.contextPath}/aeropuerto?action=mostrar">Aeropuertos</a></li>            
                <li><a href="${pageContext.request.contextPath}/aviones?action=mostrar">Aviones</a></li>            
        </ul>
        <script src="js/materialize.js" type="text/javascript"></script>
        <script>
            $('#itemMenu').click(function () {
                var elem = document.querySelector('.sidenav');
                var instance = M.Sidenav.getInstance(elem);
                instance.open();

            });
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                M.AutoInit();
            });
        </script>
        <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
    </body>
</html>
