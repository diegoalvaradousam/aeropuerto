
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
                <form action="${pageContext.request.contextPath}/aviones?action=actualizar" method="POST">
                    <div class="col s12 m6 l6">
                        <div class="row">
                            <div class="input-field col s6" style="display: none;">                     
                                <label for="codAvion">Codigo del Avion <i class="fa-lg fas fa-code"></i></label>
                                <input type="text" id="codAvion" class="autocomplete" name="codAvion" value="${ver.codAvion}"> 
                            </div>
                            <div class="input-field col s6">                     
                                <label for="numPlazas">Numero de las Plazas <i class="fa-lg fas fa-chair"></i></label>
                                <input type="text" id="numPlazas" class="autocomplete" name="numPlazas" value="${ver.num_plazas}"> 
                            </div>
                        </div>   
                        <div class="row">
                            <div class="input-field col s6">
                                <select name="aeropuerto" id="aeropuerto" value="${ver.cod_aeropuerto.codAeropuerto}">
                                    <option value="" disabled selected>Seleccione</option>
                                </select>
                                <label>Aeropuerto de Salida <i class="fa-lg fas fa-plane-departure"></i></label>
                            </div> 
                            <script>

                                $(document).ready(function () {
                                    console.log("READY");
                                    $("#aeropuerto").val('${ver.cod_aeropuerto.codAeropuerto}').change();
                                });</script>
                        </div> 

                        <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Actualizar</button>

                </form>
            </c:forEach>    

        </div> 


    </div> 
    <script src="../js/materialize.js" type="text/javascript"></script>
    <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    M.AutoInit();
                                });
                                $(document).ready(function () {
                                    console.log("READY");
                                    $.ajax({
                                        method: "GET",
                                        url: "/parcial2Vuelos/reserva?action=viewAirport"
                                    }).done(function (data) {
                                        console.log(data);
                                        $('#aeropuerto').append(data);
                                        $('#aeropuerto').formSelect();
                                        // alert(data); // imprimimos la respuesta
                                    }).fail(function () {
                                        alert("Algo salió mal");
                                    }).always(function () {
                                        //   alert("Siempre se ejecuta")
                                    });
                                });
    </script>
    <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
</body>
</html>
