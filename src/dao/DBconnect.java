package dao;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	public static Connection connection;
	static{
	try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/agence","root","");
			
		}catch(Exception e){
			System.out.println("Error"+e);
	}
}
	static Connection getConnection(){
		return connection;
	}
}