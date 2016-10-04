<%
  String userid = (String)session.getAttribute("userid");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Consultar puesto</title>

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
    <menu:navbar title="Sistema de votación electrónico" subtitle="Consultar puesto"/>
<!-------------------------------------------------------------------------------------------------- -->
 
    <%

  try{
  %>
          
                       <!-- Tabla- -->
              <div class="container">
                <div class="section">
                  <div class="row">
                    <form class="col s12" method="post" action="getcedula.jsp">
                    <!-- --------------------------------------- -->
                      <div class="row">
                        <div class="input-field col s12">
                          <input id="id1" name="cedula" type="number">
                          <label for="id1">Cedula</label>
                        </div>
                      </div>
                     
                      
                      <!-- ---------------------------------------- -->
                      <div class="row">
                        <div class="input-field col s12">
                          <button class="btn waves-effect waves-light" type="submit" name="action" required="1">Consultar puesto
                            <i class="material-icons right">send</i>
                          </button>
                        </div>
                      </div>
                      <!-- ---------------------------------------- -->
                    </form>
                  </div>        
                </div>
              </div>
           <!-- Tabla -->
            
           <%
                           
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }
                 
                
                %>


    
   
     
   
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
<!-- ----------------------------------------------------------------------------------------------- -->

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>
