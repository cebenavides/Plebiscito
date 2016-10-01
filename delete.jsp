<%
   String id = request.getParameter("id");
%>
<HTML> 
<HEAD>
  <TITLE>Eliminar puesto </TITLE>
</HEAD>
<BODY>
<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
					Statement instruccion = conexion.createStatement();
					int val = instruccion.executeUpdate("delete from puestos where id ="+Integer.parseInt(id)+"");
           response.sendRedirect("/Listpuesto.jsp");
					%>
					<h3> Puesto eliminado</h3>

	 	             <% 
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }
               
                
                %>
        </BODY>
</HTML>
