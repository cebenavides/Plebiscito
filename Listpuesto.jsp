<%
  String userid = (String)session.getAttribute("userid");
  String dep = request.getParameter("dep");
  String city = request.getParameter("ciudad");
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
  <%  
    if(userid == null){
      response.sendRedirect("/");
    }
  %>  
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbar title="Sistema de votación electrónico" subtitle="Puestos de votación"/>

                <%
               try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
          Statement instruccion = conexion.createStatement();
          Statement instruccion2 = conexion.createStatement();
          ResultSet tabla = instruccion.executeQuery("SELECT p.id,p.nombre,p.direccion,d.nombre,c.nombre FROM puestos p,ciudades c,departamentos d WHERE (p.idciudad=c.idciudades AND c.iddepartamento=d.iddepartamentos AND p.idciudad="+city+");");
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
             <%
              ResultSet tabla2 = instruccion2.executeQuery("select count(idpuesto) from votantes where idpuesto="+tabla.getString(1)+" group by idpuesto;");
              if(!tabla2.next()){
             %>
             <td><a href="delete.jsp?id=<%=tabla.getString(1)%>&ciudad=<%=city%>" class="btn-floating blue"><i class="material-icons">delete</i></a></td> 
             <% }else{ %>
             <td></td>
             <% } %>
             <td><a href="edit.jsp?id=<%=tabla.getString(1)%>&ciudad=<%=city%>" class="btn-floating blue"><i class="material-icons">mode_edit</i></a>
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


  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>