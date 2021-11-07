
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
                                <li><a href="../modulo-clientes/clientes.jsp" >Clientes<i class="small material-icons left">group</i></a></li>
                                <li><a href="../modulo-tarjeta/tarjeta.jsp"><i class="fas fa-id-card left"></i>Añadir Tarjeta</a></li>                   
                                <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                                <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Añadir Aeropuertos</a></li>
                                <li><a href="../modulo-aviones/aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Añadir Aviones</a></li>
                            </ul>
                        </div>
                    </nav>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a href="../modulo-clientes/clientes.jsp" >Clientes<i class="small material-icons left">group</i></a></li>
                        <li><a href="agregar-tarjeta.jsp" >Agregar Tarjeta<i class="fas fa-plus left"></i><i class="fas fa-id-card left"></i></a></li>                           
                        <li class="active"><a href="../modulo-reserva/reserva.jsp"><i class="small material-icons left">assignment_turned_in</i>Reserva de vuelo de clientes</a></li>
                        <li><a href="../modulo-aeropuerto/aeropuerto.jsp"><i class="fas fa-plane-departure left"></i>Añadir Aeropuertos</a></li>
                        <li><a href="../modulo-aviones/aviones.jsp"><i class="small material-icons left">airplanemode_active</i>Añadir Aviones</a></li>
                    </ul>
                </div>
            </div>
        </div>





        <div class="container"> 
            <form action="reserva?action=insertar" method="POST">
                <div class="col s12 m6 l6">
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Codigo de Reserva <i class="fa-lg fas fa-hourglass-start"></i></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="Cod_reserva" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Fecha de Salida <i class="fa-lg fas fa-hourglass-start"></i></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="fecha_salida" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Fecha Estimada de Llegada <i class="fa-lg fas fa-hourglass-end"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="fecha_llegada" value=""> 
                        </div>
                    </div>   
                    <div class="row">
                        <div class="input-field col s6">
                            <select name="aeropuerto_salida" id="aeropuerto_salida">
                                <option value="" disabled selected>Seleccione</option>
                            </select>
                            <label>Aeropuerto de Salida <i class="fa-lg fas fa-plane-departure"></i></label>
                        </div> 
                        <div class="input-field col s6">
                            <select name="aeropuerto_llegada" id="aeropuerto_llegada">
                                <option value="" disabled selected>Seleccione</option>

                            </select>
                            <label>Aeropuerto de Llegada <i class="fa-lg fas fa-plane-arrival"></i></label>
                        </div>
                    </div> 

                    <div class="row">
                        <div class="input-field col s6">
                            <select>
                                <option value="" disabled selected>Seleccione</option>
                                <option name="DNI_cliente">1</option>
                            </select>
                            <label>DNI del Cliente <i class="fa-lg fas fa-id-card-alt"></i></label>
                        </div>

                        <div class="input-field col s6">
                            <select name="cod_avion">
                                <option value="" disabled selected>Seleccione</option>
                                <option >1</option>
                            </select>
                            <label>Codigo del Avion <i class="fa-lg fab fa-telegram-plane"></i></label>
                        </div>
                    </div> 


                    <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Agregar</button>

                </div>
            </form>

        </div> 


    </div> 
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                $('#aeropuerto_llegada').add(data);
                $('#aeropuerto_salida').add(data);
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
