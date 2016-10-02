<%
  String userid = (String)session.getAttribute("userid");
%>
<%
   String nombre = request.getParameter( "nombre" );
   String apellido = request.getParameter( "apellido" );
   String cedula = request.getParameter( "cedula" );
   String idpuesto = request.getParameter( "idpuesto" );
%>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Sistema de votación</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>

<body>
    <%@page contentType="text/html"%> 
    <%@page pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
    <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %> 
    <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
    <menu:navbar/>
<!-------------------------------------------------------------------------------------------------- -->
     <PRE>
      


    </PRE>
  
    <%

  try{
           Class.forName("com.mysql.jdbc.Driver");
           
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
           
          Statement instruccion = conexion.createStatement();
           
          //int val = instruccion.executeUpdate("INSERT INTO `plebiscito`.`votantes` (`cedula`, `nombre`, `apellido`, `idpuesto`, `checkVoto`) VALUES ('"+cedula+"', '"+nombre+"','"+apellido+"', '"+idpuesto+"', '0');");//
          int val = instruccion.executeUpdate("INSERT INTO `plebiscito`.`votantes` (`cedula`, `nombre`, `apellido`, `idpuesto`, `checkVoto`) VALUES ('"+cedula+"', '"+nombre+"','"+apellido+"', '1', '0');");
        
        
                %>
                       <h3>Los datos fueron ingresados correctamente</h3>
            <% 
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }
               
                
                %>
</html>