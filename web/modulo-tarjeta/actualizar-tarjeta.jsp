
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page  session="true" %>

<%
    HttpSession sesion = request.getSession();
    String usuario;

    if (session.getAttribute("usuario") != null) {
        usuario = session.getAttribute("usuario").toString();

    } else {
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
                <form action="/parcial2Vuelos/tarjeta?action=actualizar" method="POST">
                    <div class="col s12 m6 l6">
                        <div class="row">
                            <div class="input-field col s6" style="display: none;">                     
                                <label for="tarjeta_embarque">Tarjeta de Embarque <i class="fa-lg fas fa-couch"></i></label>
                                <input type="number" id="tarjeta_embarque" class="autocomplete" name="tarjeta_embarque" value="${ver.tarjetaEmbarque}"> 
                            </div>
                            <div class="row">
                                <div class="input-field col s6">                     
                                    <select name="clase" id="clase" required="true" onchange="fillAsientos();">
                                        <!--                                        <option value="" disabled selected >Elija clase</option>-->
                                        <option value="Primera Clase" >Primera Clase</option>
                                        <option value="Turista">Turista</option>
                                        <option value="Economica">Económica</option>
                                    </select>
                                    <label>Clase<i class="fa-lg fas fa-id-card-alt"></i></label>
                                </div>
                                <div class="input-field col s6">                     
                                    <select name="asiento" id="asiento" required="true">
                                    </select>
                                    <label>Asiento<i class="fa-lg fas fa-id-card-alt"></i></label> 
                                </div>
                            </div> 
                            <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Actualizar</button>
                            </form>
                            <script>

                                $(document).ready(function () {
                                    M.AutoInit();

                                    console.log("READY");
                                    console.log("CLASE " + '${ver.clase}');
                                    console.log("ASIENTO " + '${ver.asiento}');
                                    $("#clase").val('${ver.clase}').change();
                                    $('#clase').formSelect();
                                    $('#asiento').empty();
                                    var clase = $('#clase').val();
                                    var html = '';
                                    if (clase === 'Primera Clase') {
                                        for (var i = 1; i <= 35; i++) {
                                            html += '<option value="' + i + '">' + 'Asiento N° ' + i + '</option>';
                                        }
                                    } else if (clase === 'Turista') {
                                        for (var i = 36; i <= 70; i++) {
                                            html += '<option value="' + i + '">' + 'Asiento N° ' + i + '</option>';
                                        }
                                    } else if (clase === 'Economica') {
                                        for (var i = 71; i <= 100; i++) {
                                            html += '<option value="' + i + '">' + 'Asiento N° ' + i + '</option>';
                                        }
                                    }
                                    $('#asiento').append(html);
                                    $('#asiento').formSelect();
                                    $("#asiento").val('${ver.asiento}').change();
                                    $('#asiento').formSelect();

                                });
                                function fillAsientos() {
                                    $('#asiento').empty();
                                    var clase = $('#clase').val();
                                    var html = '';
                                    if (clase === 'Primera Clase') {
                                        for (var i = 1; i <= 35; i++) {
                                            html += '<option value="' + i + '">' + 'Asiento N° ' + i + '</option>';
                                        }
                                    } else if (clase === 'Turista') {
                                        for (var i = 36; i <= 70; i++) {
                                            html += '<option value="' + i + '">' + 'Asiento N° ' + i + '</option>';
                                        }
                                    } else if (clase === 'Economica') {
                                        for (var i = 71; i <= 100; i++) {
                                            html += '<option value="' + i + '">' + 'Asiento N° ' + i + '</option>';
                                        }
                                    }
                                    $('#asiento').append(html);
                                    $('#asiento').formSelect();
                                }
                            </script>
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
