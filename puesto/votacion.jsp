<% String puestoactual = (String)session.getAttribute("puestoactual"); 
String idpuestoactual = (String)session.getAttribute("idpuestoactual");%>

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
  <%  
    if(puestoactual == null || idpuestoactual == null){
      response.sendRedirect("/");
    }
  %>  
  <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbarpuesto title="Puesto de votación" subtitle="<%= puestoactual %>"/>
  
  <div class="container">
    <div class="section">
      <div class="row">
        <form class="col s12" method="post" action="validar.jsp">
          <div class="row">
            <div class="input-field col s12">
              <input id="id" name="cedula" type="number" class="validate" required="1">
              <label for="id">Cédula</label>
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
    </div>
  </div>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>