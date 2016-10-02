<%
  String userid = (String)session.getAttribute("userid");
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <%@page contentType="text/html"%> 
  <%@page pageEncoding="UTF-8"%>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Listado de puestos de votación</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>

<body>
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbar/>

  <div class="section no-pad-bot blue blue-darken-4" id="index-banner">
    <div class="container">
      <br><br>
      <h1 class="header center white-text">Listado de puestos de votación</h1>
      <div class="row center">
         <% if (userid!=null) { %>
          <h5 class="header col s12 light white-text">Bienvenido, <%= userid %></h5>
        <% } %>
        <br><br>     
      </div>
      <br><br>
    </div>
  </div>

                <%
               try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
          Statement instruccion = conexion.createStatement();
          ResultSet tabla = instruccion.executeQuery("SELECT p.id,p.nombre,p.direccion,d.nombre,c.nombre FROM puestos p,ciudades c,departamentos d WHERE p.idciudad=c.idciudades AND c.iddepartamento=d.iddepartamentos;");
           %>
  <table class="highlight"> 
      <tr>   
             <td> <B>Numero</B></td>
             <td> <B>Nombre del puesto de votación</B></td>
             <td> <B>Ubicación</B></td>
             <td> <B>Departamento</B></td>
             <td><B>Ciudad</B></td>
             <td></td>
             <td></td>
           </tr> 
  <%while (tabla.next())  { %>    
           <tr>   
             <td><%=tabla.getString(1)%></td>
             <td><%=tabla.getString(2)%></td>
             <td><%=tabla.getString(3)%></td> 
             <td><%=tabla.getString(4)%></td>
             <td><%=tabla.getString(5)%></td> 
             <td><a href="delete.jsp?id=<%=tabla.getString(1)%>" class="btn-floating blue"><i class="material-icons">delete</i></a> 
             <td><a href="edit.jsp?id=<%=tabla.getString(1)%>" class="btn-floating blue"><i class="material-icons">mode_edit</i></a>
             </td>
           </tr>      
  <%}%>
  </table>
 <%                  
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }      
                %>
<center>
<a href="Rpuesto.jsp" class="waves-effect waves-light btn"><i class="material-icons left">library_add</i> ingresar puesto de votación</a>
</center> 

  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>