<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%
try{
	String man = (String)session.getAttribute("man");
	String dec = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
	Statement instruccion = conexion.createStatement();
	int val = instruccion.executeUpdate("INSERT INTO votos (voto, idpuesto) VALUES ("+dec+","+(String)session.getAttribute("idpuestoactual")+");");
	int val2 = instruccion.executeUpdate("UPDATE votantes SET checkVoto='1' WHERE cedula='"+man+"';");
	session.setAttribute("man",null);
}catch(Exception e){
	out.println("ERROR! "+e.getMessage());
}
%>