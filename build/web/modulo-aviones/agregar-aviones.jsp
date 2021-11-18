
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
        <jsp:include page='../navbar.jsp'/>
        <br> 
        <div class="container"> 
            <form action="usuario?action=insertar" method="POST">
                <div class="col s12 m6 l6">
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Codigo del Avion <i class="fa-lg fas fa-code"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="Cod_avion" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Numero de las Plazas <i class="fa-lg fas fa-chair"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="num_plazas" value=""> 
                        </div>
                    </div>   
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="autocomplete-input">Localidad del Aeropuerto <i class="fa-lg fas fa-code"></i></label>
                            <input type="text" id="autocomplete-input" class="autocomplete" name="Cod_aeropuerto" value=""> 
                        </div>
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

    </script>
    <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
</body>
</html>
