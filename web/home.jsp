
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
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link href="https://fonts.googleapis.com/icon?fa Fmily=Material+Icons" rel="stylesheet"><!-- comment -->
        <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
        <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
        <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style   >
            body {
                overflow: hidden; /* Hide scrollbars */
            }
        </style>
    <script type="text/javascript">
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
</script>

<style>
body {
  background-image: url('https://wallpaperaccess.com/full/1307258.jpg');
}
</style>
    </head>

    <body onLoad="noBack();"  onpageshow="if (event.persisted) noBack();" onUnload="">
         <jsp:include page='navbar.jsp' >
                        <jsp:param name="name" value="Jorge"/>
                    </jsp:include>

        <!--////////////////////////////////////////////////// 
        <div class="row">
            <div class="col s12 m6 l4">
                <h1>Noticia 1</h1>
                <img src="imagen/uracan.jpg" alt="alt"/>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laborum eos quisquam totam deleniti quam maiores tempora aliquam voluptas. Neque aspernatur labore deserunt officia doloribus consequatur maiores adipisci dolore harum alias! </p>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laborum eos quisquam totam deleniti quam maiores tempora aliquam voluptas. Neque aspernatur labore deserunt officia doloribus consequatur maiores adipisci dolore harum alias!</p>
    
                <ul class="pagination">
                    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                    <li class="active"><a href="#!">1</a></li>
                    <li class="waves-effect"><a href="#!">2</a></li>
                    <li class="waves-effect"><a href="#!">3</a></li>
                    <li class="waves-effect"><a href="#!">4</a></li>
                    <li class="waves-effect"><a href="#!">5</a></li>
                    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                </ul>
            </div>
    
            <div class="col s12 m12 l4">
                <h1>Noticia 2</h1>
                <img src="imagen/uracan.jpg" alt="alt"/>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laborum eos quisquam totam deleniti quam maiores tempora aliquam voluptas. Neque aspernatur labore deserunt officia doloribus consequatur maiores adipisci dolore harum alias! </p>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laborum eos quisquam totam deleniti quam maiores tempora aliquam voluptas. Neque aspernatur labore deserunt officia doloribus consequatur maiores adipisci dolore harum alias!</p>
            </div>
    
    
            <div class="col s12 m12 l4">
                <h1>Noticia 3</h1>
                <img src="imagen/uracan.jpg" alt="alt"/>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laborum eos quisquam totam deleniti quam maiores tempora aliquam voluptas. Neque aspernatur labore deserunt officia doloribus consequatur maiores adipisci dolore harum alias! </p>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laborum eos quisquam totam deleniti quam maiores tempora aliquam voluptas. Neque aspernatur labore deserunt officia doloribus consequatur maiores adipisci dolore harum alias!</p>
    
            </div>
        </div> 
        <!--////////////////////////////////////////////////// 
        <div class="row">
            <div class="col s12 m6 l6">
                <h2>Datos Empleados</h2>
                <table class="highlight"> 
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>nombre</th>
                            <th>apellido</th>
                            <th>edad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <th>juan</th>
                            <th>barrera</th>
                            <th>45</th>
                        </tr>
                        <tr>
                            <th>2</th>
                            <th>juan</th>
                            <th>barrera</th>
                            <th>45</th>
                        </tr>
                        <tr>
                            <th>3</th>
                            <th>juan</th>
                            <th>barrera</th>
                            <th>45</th>
                        </tr>
                        <tr>
                            <th>4</th>
                            <th>juan</th>
                            <th>barrera</th>
                            <th>45</th>
                        </tr>
                        <tr>
                            <th>5</th>
                            <th>juan</th>
                            <th>barrera</th>
                            <th>45</th>
                        </tr>
                    </tbody>   
                </table>   
            </div>
    
    
            <div class="col s12 m6 l6">
    
                <form action="usuario?action=insertar" method="POST">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">airline_seat_recline_normal</i>
                        <input type="text" id="autocomplete-input" class="autocomplete" name="Nombre" value="">
                        <label for="autocomplete-input">Nombre</label>
                    </div>
               
                
                
                    <div class="input-field col s12">
                        <i class="material-icons prefix">airline_seat_recline_normal</i>
                        <input type="text" id="autocomplete-input" class="autocomplete" name="Apellido" value="">
                        <label for="autocomplete-input">Apellido</label>
                    </div>
              
                
               
                    <div class="input-field col s12">
                        <i class="material-icons prefix">airline_seat_recline_normal</i>
                        <input type="number" id="autocomplete-input" class="autocomplete" name="Edad" value="">
                        <label for="autocomplete-input">Edad</label>
                    </div>
                    <button type="submit" class="waves-effect waves-light btn"><i class="material-icons right">cloud</i>Enviar</button>
    
              </form>
            </div>
        </div> 
    
        <!--   <div class="col s12 m6 l6">
               <h1>pie 2</h1>
           </div>
       </div>   -->
        <!--//////////////////////////////////////////////////
    
        <div class="row">
    
    
            <div class="col s12 l4 m2">
                <h3>1</h3> 
    
            </div>
            <div class="col s12 l4 m2">
                <h3>2</h3> 
            </div>
            <div class="col s12 l4 m2">
                <h3>3</h3> 
            </div>  
            <div class="col s12 l4 m2">
                <h3>4</h3> 
            </div> 
            <div class="col s12 l4 m2">
                <h3>5</h3> 
            </div> 
            <div class="col s12 l4 m2">
                <h3>6</h3> 
            </div> 
        </div> 
    </div> 
    </div> -->
        <script src="js/materialize.js" type="text/javascript"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                M.AutoInit();
            });
        </script>
        <script src="https://kit.fontawesome.com/cc794b3cc5.js" crossorigin="anonymous"></script>
    </body>
</html>
