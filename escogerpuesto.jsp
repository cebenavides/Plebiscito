<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%
  try{
    String id = request.getParameter("puesto");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
    Statement instruccion = conexion.createStatement();
    ResultSet tabla = instruccion.executeQuery( "select * from puestos where id="+id+";"); 
    if (tabla.next()){
      session.setAttribute("puestoactual",tabla.getString(2));
      session.setAttribute("idpuestoactual",tabla.getString(1));
      response.sendRedirect("/puesto/votacion.jsp");
    }
  } catch(Exception e){
    out.println("ERROR! "+e.getMessage());
  }
%>