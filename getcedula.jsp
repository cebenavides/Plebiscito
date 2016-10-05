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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
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
          Class.forName("com.mysql.jdbc.Driver");
           
          Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
           
          Statement instruccion = conexion.createStatement();
           
          ResultSet tabla = instruccion.executeQuery("Select vot.nombre,vot.apellido,vot.cedula,pue.nombre,dep.nombre as Departamento,ciu.nombre as Ciudad,pue.direccion from ciudades as ciu, puestos as pue, votantes as vot,departamentos as dep where vot.cedula='"+cedula+"' and ciu.iddepartamento=dep.iddepartamentos and vot.idpuesto=pue.id and  pue.idciudad=ciu.idciudades;");
           %>
                       <!-- Tabla- -->
               <div class="container">
                <div class="section">
                  <div class="row">
                    <!-- ----------------- -->
                      <TABLE class="highlight">
                          <TR>
                            <TD><b>Nombre </b></TD>
                            <TD><b>Apellido </b></TD>
                            <TD><b>Cedula</b></TD>
                            <TD><b>Puesto</b></TD>
                            <TD><b>Departamento</b></TD>
                            <TD><b>Ciudad </b></TD>
                            <TD><b>Dirección</b></TD>
                          </TR>
                          <%
                            if (tabla.next())  {

                              %>
                              <TR>
                              <TD><%= tabla.getString(1)%> </TD>
                              <TD><%= tabla.getString(2)%></TD>
                              <TD><%= tabla.getString(3)%> </TD>
                              <TD><%= tabla.getString(4)%></TD>
                              <TD><%= tabla.getString(5)%> </TD>
                              <TD><%= tabla.getString(6)%></TD>
                              <TD><%= tabla.getString(7)%></TD>
                              </TR>     
                              <%
                            }else{ %>
                              <script>function loco() {
        swal({   
          title: "Tarjetón",   
          text: "¿Apoya usted el acuerdo final para terminar el conflicto y construir una paz estable y duradera?",   
          type: "warning",   
          showCancelButton: true,   
          confirmButtonColor: "#009900",   
          confirmButtonText: "Sí",    
          cancelButtonText: "No",   
          closeOnConfirm: false,   
          closeOnCancel: false 
        }, 
        function(isConfirm){   
          if (isConfirm) {     
            
          } else {     
            window.location = "index.jsp";  
        }       
        });
    }   </script>
                          <% } %>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script src="js/custom4.js"></script>
  </body>
</html>
