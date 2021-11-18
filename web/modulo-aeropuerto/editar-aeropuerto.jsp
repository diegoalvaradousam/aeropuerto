
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
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
    </head>
    <body>
        <jsp:include page='../navbar.jsp'/>
        <br>     
        <div class="container"> 
            <c:forEach items="${lista}" var="ver">
                <form action="${pageContext.request.contextPath}/aeropuerto?action=actualizar" method="POST">
                    <div class="col s12 m6 l6">
                        <div class="row">
                            <div class="input-field col s6" style="display: none;">                     
                                                        <label for="codAeropuerto">Codigo del Aeropuerto <i class="fa-lg fas fa-code"></i></label>
                                                        <input type="hidden" id="codAeropuerto" class="autocomplete" name="codAeropuerto" value="${ver.codAeropuerto}"> 
                                                    </div>
                            <div class="input-field col s6">                     
                                <label for="nombreAeropuerto">Nombre del Aeropuerto <i class="fa-lg fas fa-signature"></i></label>
                                <input type="text" id="nombreAeropuerto" class="autocomplete" name="nombreAeropuerto" value="${ver.nombreAeropuerto}"> 
                            </div>
                        </div>   
                        <div class="row">
                            <div class="input-field col s6">                     
                                <label for="localidad">Localidad del Aeropuerto <i class="fa-lg fas fa-map-marker-alt"></i></label>
                                <input type="text" id="localidad" class="autocomplete" name="localidad" value="${ver.localidad}"> 
                            </div>
                            <div class="input-field col s6">                     
                                <label for="pais">Pais del Aeropuerto <i class="fa-lg fas fa-flag"></i></label>
                                <input type="text" id="pais" class="autocomplete" name="pais" value="${ver.pais}"> 
                            </div>
                        </div> 

                        <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Actualizar</button>
                    </div> 
                </form>
            </c:forEach>    

        </div> 
        <script src="../js/materialize.js" type="text/javascript"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                M.AutoInit();
            });

        </script>
        <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
    </body>
</html>
