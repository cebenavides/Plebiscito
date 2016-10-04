<% String puestoactual = (String)session.getAttribute("puestoactual"); 
String idpuestoactual = (String)session.getAttribute("idpuestoactual"); 
String idvotante = request.getParameter("cedula");
session.setAttribute("man",idvotante);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Sistema de votación</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
</head>

<body>
  <%  
    if(puestoactual == null || idpuestoactual == null || idvotante == null){
      response.sendRedirect("/");
    }
  %>  
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbarpuesto title="Puesto de votación" subtitle="<%= puestoactual %>"/>

  <div class="container">
    <div class="section">
      <div class="row">
        <%      
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
          Statement instruccion = conexion.createStatement();
          ResultSet tabla = instruccion.executeQuery( "select * from votantes where cedula="+idvotante+";");
          if (tabla.next()){ 
            if(tabla.getString(4).equals(idpuestoactual)){
              if(tabla.getInt(5)==0){ %>
                <p>Usted está autorizado para votar</p>
                <a id="votar" class="waves-effect waves-light btn-large">Votar</a>                
              <% }else{ %>
                <p>Ya usted votó.</p>
                <a class="waves-effect waves-light btn-large disabled">Votar</a>
              <% }
            }else{ %>
              <p>No registrado en este puesto.</p>
              <a class="waves-effect waves-light btn-large disabled">Votar</a>
            <% } %>
        <% }else{ %>
          <p>Usted no está registrado.</p>
          <a class="waves-effect waves-light btn-large disabled">Votar</a>
        <%  } }catch(Exception e){
          out.println("ERROR! "+e.getMessage());
        } %>
        <a href="votacion.jsp" class="waves-effect waves-light btn-large">Regresar</a>
      </div>        
    </div>
  </div>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script> 
  <script src="js/custom2.js"></script>   
  </body>
</html>