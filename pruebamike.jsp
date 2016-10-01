<%@page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*,org.json.simple.*" %>
<%
    try{
    	JSONArray arreglo = new JSONArray();
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
        Statement instruccion = conexion.createStatement();
        ResultSet tabla = instruccion.executeQuery( "select * from puestos where idciudad="+id+" order by nombre;");
        while(tabla.next()){
	        JSONObject objeto = new JSONObject();
	        objeto.put("idpuesto", tabla.getString(1));
		    objeto.put("nombre", tabla.getString(2));	   
		    arreglo.add(objeto);
	    }
	    out.print(arreglo);
	    out.flush();
	}catch(Exception e){
		out.println("ERROR! "+e.getMessage());
	}
    

%>