
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
        <div class="container-fluid">
            <div class="row">
                <div class="col s12">
                    <nav style="background-color: purple">
                        <div class="nav-wrapper" >
                            <a class="brand-logo">&nbsp; Reservas de Vuelos <i class="fas fa-paper-plane right"></i></a> 
                            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                            <ul class="right hide-on-med-and-down">
                                <li><a href="../" >Index<i class="fas fa-location-arrow left"></i></a></li>
                                <li><a href="../modulo-clientes/clientes.jsp" > Clientes<i class="small material-icons left">group</i></a></li>
                                <li><a href="../modulo-tarjeta/tarjeta.jsp"><i class="fas fa-id-card left"></i>Tarjeta</a></li>                              
                                <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                                <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Aeropuertos</a></li>
                                <li><a href="agregar-aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Agregar Aviones</a></li>
                            </ul>
                        </div>
                    </nav>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a href="../" >Index<i class="fas fa-location-arrow left"></i></a></li>
                        <li><a href="../modulo-clientes/clientes.jsp" > Clientes<i class="fas fa-user-plus left"></i></a></li>
                        <li><a href="../modulo-tarjeta/tarjeta.jsp"><i class="fas fa-id-card left"></i> Tarjeta</a></li>                              
                        <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                        <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Aeropuertos</a></li>
                        <li><a href="agregar-aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Agregar Aviones</a></li>
                    </ul>                 
                </div>
            </div>
        </div><br> 

        <div class="container service" >

            <div class="row">
                <c:forEach items="${lista}" var="ver">
                    <div class="col s12 m6 l3 center-align">
                        <div class="card">
                            <div class="card-image">
                                <img src="../imagen/plane.png">
                                <span class="card-title">Aviones</span>
                                <a  href="actualizar-aviones.jsp" class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
                            </div>
                            <div class="card-content">

                                <tr>
                                    <td>Codigo del Avion: <br>${ver.Cod_avion} </td><br>   
                                <td>Numero de Plazas <br>${ver.num_plazas}</td><br>  
                                <td>Codigo del aeropuerto <br>${ver.Cod_aeropuerto}</td><br>  

                                </tr>

                            </div>
                        </div>
                    </div>
                </c:forEach>    

            </div>

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
