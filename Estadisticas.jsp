<!DOCTYPE html>
<html lang="es">
<head>
  <%@page contentType="text/html"%> 
  <%@page pageEncoding="UTF-8"%>
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*,org.json.simple.*" %>
  <title>Registrar puesto de votación</title>
  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbar/>
  
  <div><h3 class="center-align">Estadísticas</h3></div>

  <div class="container">
    <div class="section">
      <div class="row">
        <div class="input-field col s12">
          
        </div>
      </div>
    </div>
  </div>


  <div id="container1" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

  <center>
    <%try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
    Statement instruccion2 = conexion.createStatement();
    ResultSet val2 = instruccion2.executeQuery("SELECT id, nombre FROM plebiscito.puestos");%>  
    <form action="demo_form.asp" method="get" id="form1">
      <div class="row">
        <div class="input-field col s12">
          <select id="puest">
            <% while(val2.next()){ %>
            <option value="<%= val2.getString(1) %>"><%= val2.getString(2) %></option>
            <%}%>
            <%}catch(Exception e){
            System.out.println(e);
          } %>
        </select>
        <label> Conteo en puesto de votación específico</label>
      </div>
    </div>
  </form>
  <div class="row">
    <div class="input-field col s12">
      <button onclick="myFunction()" class="btn waves-effect waves-light"> Consultar
       <i class="material-icons right">send</i>
     </button>
   </div>
 </div>

</center>

<div id="container2" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="js/index.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
</body>
</html>