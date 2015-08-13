package com.amr.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.amr.data.User;

public class Connector {
	
	


	public static Connection getConnection(){

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
		Connection connection = null;

		try {
			connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/","admin", "admin");

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return connection;

	}
	
	public static User getUserFromCredentials(String email, String pass){
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "select * from amr.cliente where email = '" + email + "' and password = '"+pass+"';";
		User usr = null;
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(sqlQuery);
		    while(rs.next()){
		    	usr = new User(rs.getString("Nome"),
		    			rs.getString("Cognome"),
		    			rs.getString("CF"),
		    			rs.getString("Residenza"),
		    			rs.getString("email"),
		    			rs.getString("password"),
		    			true);
		    }
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usr;
	}
	
	public static ResultSet getResults(String sqlQuery){
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(sqlQuery);
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rs;
	}
	
}
