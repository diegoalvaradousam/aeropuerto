
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
                                <li><a href="../modulo-clientes/clientes.jsp" >Clientes<i class="small material-icons left">group</i></a></li>
                                <li><a href="tarjeta.jsp" >Tarjeta<i class="fas fa-id-card left"></i></a></li>                           
                                <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                                <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Añadir Aeropuertos</a></li>
                                <li><a href="../modulo-aviones/aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Añadir Aviones</a></li>
                            </ul>
                        </div>
                    </nav>
                    <ul class="sidenav" id="mobile-demo">
                       <li><a href="../" >Index<i class="fas fa-location-arrow left"></i></a></li>
                                <li><a href="../modulo-clientes/clientes.jsp" >Clientes<i class="small material-icons left">group</i></a></li>
                                <li><a href="tarjeta.jsp" >Tarjeta<i class="fas fa-id-card left"></i></a></li>                           
                                <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                                <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Añadir Aeropuertos</a></li>
                                <li><a href="../modulo-aviones/aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Añadir Aviones</a></li>
                    </ul>                 
                </div>
            </div>
        </div><br> 



    
        <div class="container"> 
            <form action="/parcial2Vuelos/tarjeta?action=insertar" method="POST">
                <div class="col s12 m6 l6">
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="asiento">Asiento <i class="fa-lg fas fa-couch"></i></label>
                            <input type="number" id="asiento" class="asiento" name="asiento" value=""> 
                        </div>
                    </div>   
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="columna">Columna <i class="fa-lg fas fa-columns"></i></label>
                            <input type="text" id="columna" class="columna" name="columna" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="planta">Planta <i class="fa-lg fas fa-ruler-horizontal"></i></label>
                            <input type="number" id="planta" class="planta" name="planta" value=""> 
                        </div>
                    </div> 

                  <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Agregar</button>



        </div> 
            </form>

    </div> 
    <script src="../js/materialize.js" type="text/javascript"></script>
  
    <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
</body>
</html>
