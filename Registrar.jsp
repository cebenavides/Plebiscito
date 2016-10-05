<%
   String nombre = request.getParameter( "nombre" );
   String direccion = request.getParameter( "direccion" );
   String ciudad = request.getParameter( "ciudad" );
%><HTML>

        <HEAD>
                <TITLE>Registrar puesto </TITLE>
        </HEAD>

        <BODY>
                <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
                <%
 			 
               try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
					Statement instruccion = conexion.createStatement();
					int val = instruccion.executeUpdate("INSERT INTO `puestos` (`nombre`, `direccion`, `idciudad`) VALUES ('"+nombre+"', '"+direccion+"', '"+ciudad+"')");
          response.sendRedirect("/buscarporparametro.jsp");
					%>
					<h3> Cliente ingresado correctamente</h3>


	 	             <% 
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }
               
                
                %>
        </BODY>
</HTML>
