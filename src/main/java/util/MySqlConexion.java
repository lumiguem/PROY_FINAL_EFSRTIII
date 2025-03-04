package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConexion {
	public static Connection getConexion() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			String url = "jdbc:mysql://localhost:3306/yata_app?useSSL=false&useTimezone=true&serverTimezone=UTC";
			String user = "root";
			String pwd = "root";
			
			con = DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			System.out.println("Error driver no instalado" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("Error de conexion con la Base de Datos" + e.getMessage());
		} catch (Exception e) {
			System.out.println("Error general: " + e.getMessage());
		}		
		return con;
	}
	
	public static void closeConexion(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Problemas al cerrar la conexion" + e.getMessage());
		}
	}
}
