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
  <title>Registrar puesto de votación</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>
<body>
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <nav class="white z-depth-3" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="/" class="brand-logo blue-text text-darken-2">Sistema de votación</a>
      <ul class="right hide-on-med-and-down">
        <li><a class="black-text" href="/">Inicio</a></li>
        <li><a class="black-text" href="cedula.jsp">Inscribir cédula</a></li>
        <li><a class="black-text" href="votacion.jsp">Consultar puesto</a></li>
        <% if (userid==null) { %>
          <li><a class="waves-effect waves-light btn amber black-text" href="login.html">Ingresar</a></li>
        <% }else{ %>
          <li><a class="black-text" href="Listpuesto.jsp">Registrar puesto</a></li>
          <li><a class="waves-effect waves-light btn amber black-text" href="salir.jsp">Salir</a></li>
        <% } %>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a class="black-text" href="/">Inicio</a></li>
        <li><a class="black-text" href="votacion.jsp">Consultar puesto</a></li>
        <% if (userid==null) { %>
          <li><a class="waves-effect waves-light btn amber black-text" href="login.html">Ingresar</a></li>
        <% }else{ %>
          <li><a class="waves-effect waves-light btn amber black-text" href="salir.jsp">Salir</a></li>
        <% } %>
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
  </nav>

  <div>
    <h3 class="center-align">Registrar puesto de votación</h3>
  </div>
  <div class="container">
    <div class="section">
      <div class="row">
          <%      
              try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
                Statement instruccion = conexion.createStatement();
                ResultSet tabla;
            %>     
          <form class="col s12" method="post" action="Registrar.jsp">
            <div class="row">
              <div class="input-field col s12">
                <input id="id" name="nombre" type="text" class="validate" required="1">
                <label for="id">Nombre del puesto</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
                <input id="id" name="direccion" type="text" class="validate" required="2" >
                <label for="id">Dirección</label>
              </div>
            </div>
            <!-- ------------------------------------- -->
            <div class="input-field col s6">
                  <select id="dropdown_dep" name="dep">
                  <%
                      tabla = instruccion.executeQuery( "select * from departamentos order by nombre;");      
                  %>
                    <option value="" disabled selected>Escoja una opción</option>
                    <% while(tabla.next()) { %>
                      <option value="<%= tabla.getInt(1) %>"><%= tabla.getString(2) %></option>
                    <% } %>
                  </select>
                  <label>Departamento</label>
                </div>
                <div class="input-field col s6">
                  <select id="dropdown_ciudad" name="ciudad">   
                    <option value="" disabled selected>Escoja una opción</option>               
                  </select>
                  <label>Ciudad</label>
                </div>
              </div> 
              <div class="row">
                <div class="input-field col s12">
                  <button class="btn waves-effect waves-light" type="submit" name="action" required="1">Enviar
                    <i class="material-icons right">send</i>
                  </button>
                </div>
              </div>

              
            <!-- .---------------------------------- -->
          </form>
      </div>       
       <%  
              }
              catch(Exception e){
                 out.println("ERROR! "+e.getMessage());
              }
            %>

    </div>
  </div>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script src="js/custom.js"></script>

  </body>
</html>