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
  <%@ taglib prefix="menu" tagdir="/WEB-INF/tags" %>
  <menu:navbar/>

  <div class="section no-pad-bot blue blue-darken-4" id="index-banner">
    <div class="container">
      <br><br>
      <h1 class="header center white-text">Sistema de votación electrónico</h1>
      <div class="row center">
         <% if (userid!=null) { %>
          <h5 class="header col s12 light white-text">Bienvenido, <%= userid %></h5>
        <% } %>
        <br><br>     
      </div>
      <br><br>
    </div>
  </div>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>
