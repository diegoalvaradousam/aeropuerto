
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
            .formulario{
                align-content: center;
                height: 100%;

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
                                <li><a href="clientes.jsp" >Clientes<i class="small material-icons left">group</i></a></li>                               
                                <li><a href="../modulo-tarjeta/tarjeta.jsp" >Tarjeta<i class="fas fa-id-card left"></i></a></li>                           
                                <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                                <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Aeropuertos</a></li>
                                <li><a href="../modulo-aviones/aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Aviones</a></li>
                            </ul>
                        </div>
                    </nav>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a href="../" >Index<i class="fas fa-location-arrow left"></i></a></li>
                        <li><a href="clientes.jsp" >Clientes<i class="small material-icons left">group</i></a></li>                               
                        <li><a href="../modulo-tarjeta/tarjeta.jsp" >Tarjeta<i class="fas fa-id-card left"></i></a></li>                           
                        <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                        <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Aeropuertos</a></li>
                        <li><a href="../modulo-aviones/aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Aviones</a></li>
                    </ul>
                </div>
            </div>
        </div>





        <div class="container"> 
            <form action="usuario?action=insertar" method="POST">
                <div class="col s12 m6 l6">
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">DNI <i class="fa-lg fas fa-id-card"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="DNI" value=""> 
                        </div>
                        <div class="input-field col s6">
                            <select>
                                <option value="" disabled selected>Seleccione</option>
                                <option name="tarjeta_embarque">1</option>

                            </select>
                            <label>Tarjeta de Embarque <i class="fa-lg fas fa-id-card-alt"></i></label>
                        </div>
                    </div>   
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Nombre de Cliente <i class="fa-lg fas fa-signature"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="nombre" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Apellido de Cliente <i class="fa-lg fas fa-signature"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="apellido" value=""> 
                        </div>
                    </div> 

                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Direccion <i class="fa-lg fas fa-map-marker-alt"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="direccion" value=""> 
                        </div> 
                    </div> 

                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Telefono <i class="fa-lg fas fa-phone"></i></label>
                            <input type="number" id="autocomplete-input" class="autocomplete" name="telefono" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Tarjeta de Credito <i class="fa-lg fas fa-credit-card"></i></label>
                            <input type="number" id="autocomplete-input" class="autocomplete" name="tarjeta_credito" value=""> 
                        </div>
                    </div> 
                    <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Agregar</button>

                </div>
            </form>

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
