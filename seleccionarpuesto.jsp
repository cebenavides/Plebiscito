<%
  String userid = (String)session.getAttribute("userid");
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
</head>

<body>
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbar/>

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
            <form class="col s12" method="post" action="escogerpuesto.jsp">
              <div class="row">
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
            <%  
              }
              catch(Exception e){
                 out.println("ERROR! "+e.getMessage());
              }
            %>
        </div>
        
      </div>
      <br><br>

      <div class="section">

      </div>
    </div>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script src="js/custom.js"></script>
  </body>
</html>