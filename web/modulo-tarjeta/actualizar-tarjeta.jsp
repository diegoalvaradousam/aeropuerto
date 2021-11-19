
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
        <br>

        <div class="container"> 
            <h3>Actualizar Tarjeta</h3>
            <c:forEach items="${lista}" var="ver">
                <form action="/parcial2Vuelos/tarjeta?action=insertar" method="POST">
                    <div class="col s12 m6 l6">
                        <div class="row">
                            <div class="input-field col s6">                     
                                <label for="tarjeta_embarque">Tarjeta de Embarque <i class="fa-lg fas fa-couch"></i></label>
                                <input type="number" id="tarjeta_embarque" class="autocomplete" name="tarjeta_embarque" value="${ver.tarjetaEmbarque}"> 
                            </div>
                            <div class="input-field col s6">                     
                                <label for="asiento">Asiento <i class="fa-lg fas fa-couch"></i></label>
                                <input type="number" id="asiento" class="autocomplete" name="asiento" value="${ver.asiento}"> 
                            </div>
                        </div>   
                        <div class="row">
                            <div class="input-field col s6">                     
                                <label for="columna">Columna <i class="fa-lg fas fa-columns"></i></label>
                                <input type="text" id="columna" class="autocomplete" name="columna" value="${ver.columna}"> 
                            </div>
                            <div class="input-field col s6">                     
                                <label for="planta">Planta <i class="fa-lg fas fa-ruler-horizontal"></i></label>
                                <input type="number" id="planta" class="autocomplete" name="planta" value="${ver.planta}"> 
                            </div>
                        </div> 
                        <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Actualizar</button>
                </form>
            </c:forEach>    

        </div> 


    </div> 
    <script src="../js/materialize.js" type="text/javascript"></script>
    <script src="./js/materialize.js" type="text/javascript"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            M.AutoInit();
        });

    </script>
    <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
</body>
</html>
