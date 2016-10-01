<%
  String userid = (String)session.getAttribute("userid");
%>

<%
   String cedula = request.getParameter( "cedula" );
%>
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
<!-------------------------------------------------------------------------------------------------- -->
     <PRE>
      


    </PRE>
  
    
<%
  try{
          Class.forName("com.mysql.jdbc.Driver");
           
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
           
          Statement instruccion = conexion.createStatement();
           
          ResultSet tabla = instruccion.executeQuery("Select vot.nombre,vot.apellido,vot.cedula,dep.nombre as Departamento,ciu.nombre as Ciudad,pue.direccion from ciudades as ciu, puestos as pue, votantes as vot,departamentos as dep where vot.cedula='"+cedula+"' and ciu.iddepartamento=dep.iddepartamentos and vot.idpuesto=pue.id and  pue.idciudad=ciu.idciudades;");
           %>
                       <!-- Tabla- -->
               <div class="container">
                <div class="section">
                  <div class="row">
                    <!-- ----------------- -->
                      <TABLE BORDER=2>
                          <TR>
                            <TD><b>Nombre </b></TD>
                            <TD><b>Apellido </b></TD>
                            <TD><b>Cedula</b></TD>
                            <TD><b>Departamento</b></TD>
                            <TD><b>Ciudad </b></TD>
                            <TD><b>Dirección</b></TD>
                          </TR>
                          <%
                            while (tabla.next())  {

                              %>
                              <TR>
                              <TD><%= tabla.getString(1)%> </TD>
                              <TD><%= tabla.getString(2)%></TD>
                              <TD><%= tabla.getString(3)%> </TD>
                              <TD><%= tabla.getString(4)%></TD>
                              <TD><%= tabla.getString(5)%> </TD>
                              <TD><%= tabla.getString(6)%></TD>
                              </TR>     
                              <%
                            }
                          %>
                    </TABLE>
                    <!-- ----------------- -->
                  </div>        
                </div>
              </div>
            
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
