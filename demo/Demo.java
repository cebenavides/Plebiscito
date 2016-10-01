import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.naming.*;
import java.util.*;
import org.json.simple.*;

public class Demo extends HttpServlet {
	public void doGet (HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException {
		PrintWriter pw = res.getWriter();
		try{
			res.setContentType("text/html");
			String id = req.getParameter("id");
			Class.forName("com.mysql.jdbc.Driver");
	        Connection conexion = DriverManager.getConnection("jdbc:mysql://plebiscito.cyacgp8je8e3.us-east-1.rds.amazonaws.com/plebiscito","root","Eliminadisimo");
	        Statement instruccion = conexion.createStatement();
	        ResultSet tabla = instruccion.executeQuery( "select * from ciudades where iddepartamento="+id+" order by nombre;");
	        pw.println(getJSONFromResultSet(tabla,"Hola"));
		}catch(Exception e){
			pw.println(e);
		}
	}

	public String getJSONFromResultSet(ResultSet rs,String keyName) {
	    Map json = new HashMap(); 
	    List list = new ArrayList();
	    if(rs!=null)
	    {
	        try {
	            ResultSetMetaData metaData = rs.getMetaData();
	            while(rs.next())
	            {
	                Map<String,Object> columnMap = new HashMap<String, Object>();
	                for(int columnIndex=1;columnIndex<=metaData.getColumnCount();columnIndex++)
	                {
	                    if(rs.getString(metaData.getColumnName(columnIndex))!=null)
	                        columnMap.put(metaData.getColumnLabel(columnIndex),     rs.getString(metaData.getColumnName(columnIndex)));
	                    else
	                        columnMap.put(metaData.getColumnLabel(columnIndex), "");
	                }
	                list.add(columnMap);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        json.put(keyName, list);
	     }
	     return JSONValue.toJSONString(json);
	}
}