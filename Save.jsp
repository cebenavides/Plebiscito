<%
   String cedula = request.getParameter( "cedula" );
   String nombre = request.getParameter( "nombre" );
   String ape = request.getParameter( "direccion" );
   String telefono = request.getParameter( "telefono" );
   String idCiudad = request.getParameter( "idCiudad" );
   
 
%><HTML>

        <HEAD>
                <TITLE>DB Test</TITLE>
        </HEAD>

        <BODY>
                <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
                <%
 			 
               try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/Prueba","root","telematica");
					Statement instruccion = conexion.createStatement();
					 
					int val = instruccion.executeUpdate("INSERT clientes VALUES("+Integer.parseInt(cedula)+",'"+nombre+"','"+direccion+"','"+telefono+"',"+Integer.parseInt(idCiudad)+")");
					 
					%>
					Los datos fueron registrados
	 	             <% 
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }
               
                
                %>
        </BODY>
</HTML>
