<%
  String userid = (String)session.getAttribute("userid");
%>
<%
   String id = request.getParameter("id");
%>


<!DOCTYPE html>
<html lang="es">
<head>
  <%@page contentType="text/html"%> 
  <%@page pageEncoding="UTF-8"%>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Editar puesto de votación</title>

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
  <menu:navbar title="Sistema de votación electrónico" subtitle="Editar puesto de votación"/>

  <div class="container">
    <div class="section">
      <div class="row">
        <form class="col s12" method="post" action="Registrar.jsp">
        <%try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
          Statement instruccion = conexion.createStatement();
          Statement instruccion2 = conexion.createStatement();
          ResultSet val = instruccion.executeQuery("SELECT p.id,p.nombre,p.direccion,d.nombre,c.nombre FROM puestos p,ciudades c,departamentos d WHERE p.idciudad=c.idciudades AND c.iddepartamento=d.iddepartamentos and p.id="+Integer.parseInt(id)+"");
          val.next();
          ResultSet val2 = instruccion2.executeQuery("select * from departamentos order by nombre;");
          %>  
          <div class="row">
            <div class="input-field col s12">
              <input id="id" value="<%=val.getString(2)%>" name="nombre" type="text" class="validate" required="1">
              <label for="id">Nombre del puesto</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input id="id" value="<%=val.getString(3)%>" name="direccion" type="text" class="validate" required="1" >
              <label for="id">Dirección</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <select id="dropdown_dep" class="validate" required="1">
                <% while(val2.next()){ %>
                <option value="<%= val2.getString(1) %>"><%= val2.getString(2) %></option>
                <% } %>
              </select>
              <label>Departamento</label>
            </div>
          </div>
          <div class="row">
            <div  class="input-field col s12">
              <select id="drowpdown_ciudad" name="ciudad"  class="validate" required="4">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
              </select>
              <label>Ciudad</label>
            </div>
          </div> 
          <div class="row">
            <center>
               <div class="input-field col s12">
                 <button class="btn waves-effect waves-light" type="submit" name="action" required="1">Guardar
                 <i class="material-icons right">send</i>
                </button>
              </div>
            </center>
          </div>
                           <% 
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }
               
                
                %>
        </form>
      </div>       

    </div>
  </div>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>