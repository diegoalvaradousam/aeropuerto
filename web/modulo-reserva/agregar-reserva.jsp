
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
            .formulario{
                align-content: center;
                height: 100%;

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
            <form action="/parcial2Vuelos/reserva?action=insertar" method="POST">
                <div class="col s12 m6 l6">
                    <div class="row">
                        <!--                        <div class="input-field col s6">                     
                                                    <label for="Cod_reserva">Codigo de Reserva <i class="fa-lg fas fa-hourglass-start"></i></i></label>
                                                    <input type="text" id="Cod_reserva" class="autocomplete" name="Cod_reserva" value=""> 
                                                </div>-->
                        <div class="input-field col s6">                     
                            <label for="fecha_salida">Fecha de Salida <i class="fa-lg fas fa-hourglass-start"></i></i></label>
                            <input type="date" id="fecha_salida" class="autocomplete" name="fecha_salida" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="fecha_llegada">Fecha Estimada de Llegada <i class="fa-lg fas fa-hourglass-end"></i></label>
                            <input type="date" id="fecha_llegada" class="autocomplete" name="fecha_llegada" value=""> 
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
                            <select name="DNI_cliente" id="DNI_cliente">
                                <option value="" disabled selected>Seleccione</option>
                            </select>
                            <label>DNI del Cliente <i class="fa-lg fas fa-id-card-alt"></i></label>
                        </div>

                        <div class="input-field col s6">
                            <select name="cod_avion" id="cod_avion">
                                <option value="" disabled selected>Seleccione</option>
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
    <script src="./js/materialize.js" type="text/javascript"></script>

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
                $('#aeropuerto_llegada').append(data);
                $('#aeropuerto_llegada').formSelect();
                $('#aeropuerto_salida').append(data);
                $('#aeropuerto_salida').formSelect();
                // alert(data); // imprimimos la respuesta
            }).fail(function () {
                alert("Algo salió mal");
            }).always(function () {
                //   alert("Siempre se ejecuta")
            });

            $.ajax({
                method: "GET",
                url: "/parcial2Vuelos/reserva?action=viewCliente"
            }).done(function (data) {
                console.log(data);
                $('#DNI_cliente').append(data);
                $('#DNI_cliente').formSelect();
                // alert(data); // imprimimos la respuesta
            }).fail(function () {
                alert("Algo salió mal");
            }).always(function () {
                //   alert("Siempre se ejecuta")
            });
            $.ajax({
                method: "GET",
                url: "/parcial2Vuelos/reserva?action=viewAvion"
            }).done(function (data) {
                console.log(data);
                $('#cod_avion').append(data);
                $('#cod_avion').formSelect();
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
