
package data;
import com.mysql.jdbc.Driver;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class FactoryConnection {
	//Capturo datos de config.properties
	private String dbDriver="com.mysql.jdbc.Driver";
	private String host;
	private String port="3306";
	private String user;
	private String pass;
	private String db;
	private String dbType="mysql";
	
	private Connection conn;
	private int cantConn=0;
	
	private FactoryConnection() throws MissingConnectionDriverException{
		try {
			Class.forName(dbDriver);
			
			Properties parameters = FactoryConnection.getConnectionParameters();

			
		    host = parameters.getProperty("host");
		    user = parameters.getProperty("user");
		    pass = parameters.getProperty("pass");
		    db = parameters.getProperty("db");
		    
		    
			
		} catch (ClassNotFoundException e) {
			throw new MissingConnectionDriverException("Error del Driver JDBC", e);
		} catch (Exception ex) {
			throw new MissingConnectionDriverException("Error en archivo de configuracion.", ex);
		}
	}
	
	private static FactoryConnection instancia;
	
	public static FactoryConnection getInstancia() throws MissingConnectionDriverException{
		if (instancia==null){
			instancia = new FactoryConnection();
		}
		return instancia;
	}
	
	public Connection getConn() throws ConnectionException{
		try {
			if(conn==null || conn.isClosed()){
				conn = DriverManager.getConnection(
						"jdbc:"+dbType+"://"+host+":"+port+"/"+
						db+"?user="+user+"&password="+pass+"&useSSL=false");
				cantConn++;
			}
		} catch (SQLException e) {
			throw new ConnectionException("Error al conectar a la DB", e);

		}
		return conn;
	}
	
	public void releaseConn() throws ConnectionException{
		try {
			cantConn--;
			if(cantConn==0){
				conn.close();
			}
		} catch (SQLException e) {
			throw new ConnectionException("Error al cerrar conexión", e);
		}
		
	}
	
	public static Properties getConnectionParameters() throws IOException {
		Properties props = new Properties();
	    InputStream input = null;
	    
	    input = new FileInputStream("configs/config.properties");
	    props.load(input);
		
	    return props;
	    
	}
}
