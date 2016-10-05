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
  <% String subtitle;
    if (userid == null) {
      subtitle = "";
    }else{
      subtitle = "Bienvenido, "+userid;
    }
  %>
  <menu:navbar title="Sistema de votación electrónico" subtitle="<%= subtitle %>"/>

  <div class="container">
    <div class="section">
      <div class="row">
        <div class="slider">
          <ul class="slides">
            <li>
              <img src="https://cdnmundo2.img.sputniknews.com/images/106107/63/1061076369.jpg"> <!-- random image -->
              <div class="caption center-align">
                <h3 class="blue-text">Vota por la paz</h3>
              </div>
            </li>
            <li>
              <img src="http://confidencialcolombia.com/images/cache/745x333/crop/images%7Ccms-image-000050043.jpg"> <!-- random image -->
              <div class="caption left-align">
                <h3>Define el futuro de Colombia</h3>
              </div>
            </li>
            <li>
              <img src="https://static.iris.net.co/semana/upload/images/2015/1/3/413912_193328_1.jpg"> <!-- random image -->
              <div class="caption right-align">
                <h3>Un voto hace la diferencia</h3>
              </div>
            </li>
            <li>
              <img src="https://cdnmundo1.img.sputniknews.com/images/105550/84/1055508466.jpg"> <!-- random image -->
              <div class="caption center-align">
                <h3>Colombia te necesita</h3>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>
