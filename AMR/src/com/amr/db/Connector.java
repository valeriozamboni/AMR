package com.amr.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.amr.data.Azienda;
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
		    			rs.getBoolean("admin"),
		    			rs.getBoolean("Affiliato") 
		    			);
		    }
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usr;
	}
	
	public static List<Azienda> getAziende(){
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "select * from amr.azienda;";
		List<Azienda> aziende = new ArrayList<Azienda>();
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(sqlQuery);
		    while(rs.next()){
		    	aziende.add(new Azienda(
		    			rs.getString("nome"),
		    			rs.getString("codice")
		    			)) ;
		    }
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return aziende;
	}
	
	public static User registerUser(String email, String pass, String nome, String cognome, String cf, String res, Boolean affiliato){
		Connection conn = getConnection();
		Statement stmt = null;
		String sqlQuery = "insert into amr.cliente (nome, cognome, cf, residenza, email, password, affiliato, admin) values ('"
				+ nome + "', '" + cognome + "', '" + cf + "', '" + res + "', '" + email + "', '" + pass + "', 0, 0);" 
				;
		User usr = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sqlQuery);
			usr = getUserFromCredentials(email, pass);
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usr;
	}
	
	public static User modifyUser(String oldemail, String oldpass, String email, String pass, String nome, String cognome, String cf, String res, Boolean affiliato){
		Connection conn = getConnection();
		Statement stmt = null;	
		String sqlQuery = "update amr.cliente set "+
					"nome = '" + nome +
					"', cognome = '" + cognome +
					"', cf = '" + cf +
					"', residenza = '" + res +
					"', email = '" + email +
					"', password = '" + pass +
					"' where email = '" + oldemail + 
					"' and password = '" + oldpass +"';";
				

		User usr = null;
		try {
			stmt = conn.createStatement();
			stmt.execute(sqlQuery);
			usr = getUserFromCredentials(email, pass);
		     
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
	
	public static void affiliaAzienda(String nome, String cod){
		Connection conn = getConnection();
		Statement stmt = null;	
		String sqlQuery = "insert into amr.azienda (nome, codice) values ("+
					"'" + nome +
					"', '" + cod +
					"')";

		try {
			stmt = conn.createStatement();
			stmt.execute(sqlQuery);   
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	
}
