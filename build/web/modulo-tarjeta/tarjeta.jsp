
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page  session="true" %>

<%
    HttpSession sesion = request.getSession();
    String usuario;
   
    
if(session.getAttribute("usuario")!= null){
    usuario = session.getAttribute("usuario").toString();
    
}else{
    request.getRequestDispatcher("/index.jsp").forward(request, response);
}

                    

    %> 
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
        <link href="https://fonts.googleapis.com/icon?fa Fmily=Material+Icons" rel="stylesheet"><!-- comment -->
        <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
        <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
        <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .body {
                background: #367;
            }

            .card {
                transition: 0.5s;
                background: #eee;
            }
            .card h5 {
                padding: 10px 0px;
            }
            .card:hover i,
            h5 {
                color: #c2185b;
            }

            .service .card:hover {
                transform: scale(1.03);
                background: #fff;
            }

        </style>
     <script type="text/javascript">
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
</script>

    </head>

    <body onLoad="noBack();"  onpageshow="if (event.persisted) noBack();" onUnload="">
        <jsp:include page='../navbar.jsp'/>


        <div class="container service" >
            <br>
                <a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/modulo-tarjeta/agregar-tarjeta.jsp">Agregar Tarjeta</a>
            <br><br>
            <div class="row">
                <c:forEach items="${lista}" var="ver">
                    <div class="col s12 m6 l3 center-align">
                        <div class="card">
                            <div class="card-image">
                                <img src="./imagen/card.png">
                                <span class="card-title">Tarjeta de Embarque</span>
                                <a href="/parcial2Vuelos/tarjeta?action=mostrarById&id=${ver.tarjetaEmbarque}" class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">edit</i></a>
                            </div>
                            <div class="card-content">

                                <tr>                                    
                                    <td>Tarjeta de Embarque: <br>${ver.tarjetaEmbarque}</td><br>  
                                <td>Asiento: <br>${ver.asiento}</td><br>  
                                <td>Columna: <br>${ver.columna}</td><br>  
                                <td>Planta: <br>${ver.planta}</td><br>                               
                                </tr>
                                <a href="/parcial2Vuelos/tarjeta?action=borrar&id=${ver.tarjetaEmbarque}" class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">delete</i></a>

                            </div>
                        </div>
                    </div>
                </c:forEach>    

            </div>

        </div>

        <script src="../js/materialize.js" type="text/javascript"></script>
        <!-- <script>
             document.addEventListener('DOMContentLoaded', function () {
                 M.AutoInit();
             });
         </script>-->
        <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
    </body>
</html>
