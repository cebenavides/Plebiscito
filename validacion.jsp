<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%      
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
	    Statement instruccion = conexion.createStatement();
	    ResultSet tabla = instruccion.executeQuery( "select * from Usuarios where (user='"+request.getParameter("user")+"' and pass='"+request.getParameter("pass")+"');");  
	    if(tabla.next()){
	    	session.setAttribute("userid",request.getParameter("user"));
	    	response.sendRedirect("/");
	    }else{
	    	session.setAttribute("userid",null);
			response.sendRedirect("/");
	    }
  	}catch(Exception e){
        out.println("ERROR! "+e.getMessage());
    }
%>    