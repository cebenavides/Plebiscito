<%@page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*,org.json.simple.*" %>
<%
    try{
    	JSONObject objeto = new JSONObject();
    	Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
        Statement instruccion1 = conexion.createStatement();
        Statement instruccion2 = conexion.createStatement();

        ResultSet tabla1 = instruccion1.executeQuery( "SELECT SUM(voto) as total FROM votos");
        ResultSet tabla2 = instruccion2.executeQuery( "select count(voto) from votos");
        tabla1.next();
        tabla2.next();
        int vS = tabla1.getInt(1);
        int vtos = tabla2.getInt(1);
        objeto.put("votossi",vS);
        objeto.put("votostotal",vtos);
        out.print(objeto);
      	out.flush();
  }catch(Exception e){
    out.println("ERROR! "+e.getMessage());
  }
%>