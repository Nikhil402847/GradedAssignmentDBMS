package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {

	private final static String DRIVER="com.mysql.cj.jdbc.Driver";
	private final static String DB_URL="jdbc:mysql://localhost:3306/gl";
	private final static String DB_USERNAME="root";
	private final static String DB_PWD=	"NNRAJ...NSV";
	private static Connection con=null;
	
	public Connection getMyConnections()
	{
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PWD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException sqe)
		{
			sqe.printStackTrace();
		}
		return con;
	}
}
