<%@ tag %>
<% String userid = (String)session.getAttribute("userid"); %>

<nav class="white z-depth-3" role="navigation">
  <div class="nav-wrapper container"><a id="logo-container" href="/" class="brand-logo blue-text text-darken-2">Sistema de votación</a>
    <ul class="right hide-on-med-and-down">
      <li><a class="black-text" href="/">Inicio</a></li>
      <li><a class="black-text" href="cedula.jsp">Inscribir cédula</a></li>
      <li><a class="black-text" href="consultar.jsp">Consultar puesto</a></li>
      <% if (userid==null) { %>
        <li><a class="waves-effect waves-light btn amber black-text" href="login.jsp">Ingresar</a></li>
      <% }else{ %>
        <li><a class="black-text" href="Listpuesto.jsp">Puestos</a></li>
        <li><a class="black-text" href="seleccionarpuesto.jsp">Asociar a puesto</a></li>
        <li><a class="black-text" href="Estadisticas.jsp">Estadísticas</a></li>
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