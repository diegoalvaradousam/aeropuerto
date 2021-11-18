
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
       <jsp:include page='../navbar.jsp'/>

        <div class="container service" >
            <form action="/parcial2Vuelos/clientes?action=insertar" method="POST"> 
                <div class="col s12 m6 l6">
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="DNI">DNI <i class="fa-lg fas fa-id-card"></i></label>
                            <input type="text" id="DNI" class="autocomplete" name="DNI" value="" required> 
                        </div>
                        <div class="input-field col s6">
                            <select name="tarjeta_embarque" id="tarjeta_embarque">
                                <option value="" disabled>Seleccione</option>
                            </select>
                            <label>Tarjeta de Embarque <i class="fa-lg fas fa-id-card-alt"></i></label>
                        </div>
                    </div>   
                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="nombre">Nombre de Cliente <i class="fa-lg fas fa-signature"></i></label>
                            <input type="text" id="nombre" class="autocomplete" name="nombre" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="apellido">Apellido de Cliente <i class="fa-lg fas fa-signature"></i></label>
                            <input type="text" id="apellido" class="autocomplete" name="apellido" value=""> 
                        </div>
                    </div> 

                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="direccion">Direccion <i class="fa-lg fas fa-map-marker-alt"></i></label>
                            <input type="text" id="direccion" class="autocomplete" name="direccion" value=""> 
                        </div> 
                    </div> 

                    <div class="row">
                        <div class="input-field col s6">                     
                            <label for="telefono">Telefono <i class="fa-lg fas fa-phone"></i></label>
                            <input type="number" id="telefono" class="autocomplete" name="telefono" value=""> 
                        </div>
                        <div class="input-field col s6">                     
                            <label for="tarjeta_credito">Tarjeta de Credito <i class="fa-lg fas fa-credit-card"></i></label>
                            <input type="number" id="tarjeta_credito" class="autocomplete" name="tarjeta_credito" value="" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="11"> 
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
                url: "/parcial2Vuelos/clientes?action=viewEmbarque"
            }).done(function (data) {
                console.log(data);
                $('#tarjeta_embarque').append(data);
                $('#tarjeta_embarque').formSelect();

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
