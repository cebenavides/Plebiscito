<%
  String userid = (String)session.getAttribute("userid");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Ingreso cedulas</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>

<body>
    <%@page contentType="text/html"%> 
    <%@page pageEncoding="UTF-8"%> 
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
                ResultSet tabla;
            %>            
            <div class="container">
              <form class="col s12" method="post" action="grabar_cedula.jsp">
              <div class="row">
                     <div class="row">
                        <div class="input-field col s12">
                          <input id="id1" name="nombre" type="text">
                          <label for="id1">Nombre</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="input-field col s12">
                          <input id="id1" name="apellido" type="text">
                          <label for="id1">apellido</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="input-field col s12">
                          <input id="id1" name="cedula" type="number">
                          <label for="id1">Cedula</label>
                        </div>
                      </div>
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
                  <select id="dropdown_puesto" name="puesto">   
                    <option value="" disabled selected>Escoja una opción</option>               
                  </select>
                  <label>Puesto</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s12">
                  <button class="btn waves-effect waves-light" type="submit" name="action" required="1">Enviar
                    <i class="material-icons right">send</i>
                  </button>
                </div>
              </div>
            </form>
            </div>
            <%  
              }
              catch(Exception e){
                 out.println("ERROR! "+e.getMessage());
              }
            %>
        </div>

 


    
   
     
   
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
<!-- ----------------------------------------------------------------------------------------------- -->

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script src="js/custom.js"></script>
  <script src="js/customike.js"></script>

  </body>
</html>
