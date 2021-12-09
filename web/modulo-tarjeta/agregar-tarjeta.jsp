
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

        <div class="container"> 
            <h3>Agregar Tarjeta</h3>
            <form action="/parcial2Vuelos/tarjeta?action=insertar" method="POST">
                <br>  
                    <div class="row">
                        <div class="input-field col s6">                     
                            <select name="clase" id="clase" required="true" onchange="fillAsientos();">
                            <option value="" disabled selected >Elija clase</option>
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

                    <button type="submit" class="waves-effect waves-light btn"><i class="fas fa-user-plus left"></i>Agregar</button>



                </div> 
            </form>

        </div> 
        <script src="../js/materialize.js" type="text/javascript"></script>
        <script>
        function fillAsientos() {
        $('#asiento').empty();
        var clase = $('#clase').val();
        var html = '';
        if (clase === 'Primera Clase') {
        for (var i = 1; i <= 35; i++) {
        html += '<option value="' + i + '">' + 'Asiento N° '+i + '</option>';
        }} else  if (clase === 'Turista') {
        for (var i = 36; i <= 70; i++) {
        html += '<option value="' + i + '">' + 'Asiento N° '+i + '</option>';
        }} else if (clase === 'Economica') {
        for (var i = 71; i <= 100; i++) {
        html += '<option value="' + i + '">' + 'Asiento N° '+i + '</option>';
        }
        }
        $('#asiento').append(html);
        $('#asiento').formSelect();
        }
        </script>
        <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
    </body>
</html>
