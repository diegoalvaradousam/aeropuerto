
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
            <form action="${pageContext.request.contextPath}/aviones?action=insertar" method="POST">
                <div class="col s12 m6 l6">
                    <div class="row">
<!--                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Codigo del Avion <i class="fa-lg fas fa-code"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="Cod_avion" value=""> 
                        </div>-->
                        <div class="input-field col s6">                     
                            <label for="numPlazas">Numero de asientos <i class="fa-lg fas fa-chair"></i></label>
                            <input type="number" id="numPlazas" class="autocomplete" name="numPlazas" value=""> 
                        </div>
                   
                    <div class="row">
                        <div class="input-field col s6">
                            <select name="aeropuerto" id="aeropuerto">
                                <option value="" disabled selected>Seleccione</option>
                            </select>
                            <label>Aeropuerto<i class="fa-lg fas fa-plane-departure"></i></label>
               
                    </div> 

                    <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Agregar</button>

            </form>

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
