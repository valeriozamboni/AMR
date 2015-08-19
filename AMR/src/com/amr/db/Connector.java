package com.amr.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.amr.data.Azienda;
import com.amr.data.Menu;
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
		    	usr = new User(rs.getInt("ClienteID"),
		    			rs.getString("Nome"),
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
	
	public static Menu getMenuFromDate(String date){
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rs_primi = null;
		ResultSet rs_secondi = null;
		ResultSet rs_contorni = null;
		String sqlQuery = "select * from amr.menu where giorno = '" + date + "';";
		Menu menu = null;
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(sqlQuery);
		    int id = -1;
		    while(rs.next()){
		    	id = rs.getInt("ID_menu");
		    	menu = new Menu(rs.getString("giorno"), id);

		    }
		    if(id> -1){
			    String sqlPrimi = "select * from amr.primo where ID_menu = '" + id + "';";
			    rs_primi = stmt.executeQuery(sqlPrimi);
			    while(rs_primi.next()){
			    	menu.addPrimo(rs_primi.getInt("ID_primo"),rs_primi.getString("nome"));
			    }
		    	String sqlSecondi = "select * from amr.secondo where ID_menu = '" + id + "';";
		    	rs_secondi = stmt.executeQuery(sqlSecondi);
			    while(rs_secondi.next()){
			    	menu.addSecondo(rs_secondi.getInt("ID_secondo"),rs_secondi.getString("nome"));
			    }
		    	String sqlContorni = "select * from amr.contorno where ID_menu = '" + id + "';";
		    	rs_contorni = stmt.executeQuery(sqlContorni);
			    while(rs_contorni.next()){
			    	menu.addContorno(rs_contorni.getInt("ID_contorno"),rs_contorni.getString("nome"));
			    }

		    }
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return menu;
	}
	
	
	public static void addMenu(String data, String primo_1, String primo_2, String primo_3, String sec_1, String sec_2, String sec_3, String contorno_1, String contorno_2, String contorno_3){
		Connection conn = getConnection();
		Statement stmt = null;
		Menu menu = getMenuFromDate(data);
		try {
		String sqlQuery = "";
		stmt = conn.createStatement();
		if(menu==null){
			sqlQuery = "insert into amr.menu (giorno) values ("+
					"'" + data +
					"')";
			stmt.execute(sqlQuery);
			menu = getMenuFromDate(data);

		}else{
			String removePrimi = "delete from amr.primo where ID_menu = '" + menu.getId() + "';";
			stmt.execute(removePrimi);
			String removeSecondi = "delete from amr.secondo where ID_menu = '" + menu.getId() + "';";
			stmt.execute(removeSecondi);
			String removeContorni = "delete from amr.contorno where ID_menu = '" + menu.getId() + "';";
			stmt.execute(removeContorni);
			String removeScelte = "delete from amr.sceltagiornaliera where ID_menu = '" + menu.getId() + "';";
			stmt.execute(removeScelte);
		}
		
		int id = menu.getId();
		String sqlPrimo_1 = "insert into amr.primo (nome, ID_menu) values (" + 
				"'" + primo_1 +
				"', '" + id +
				"')";
		stmt.execute(sqlPrimo_1);
		if(!primo_2.equals("")){
			String sqlPrimo_2 = "insert into amr.primo (nome, ID_menu) values (" + 
					"'" + primo_2 +
					"', '" + id +
					"')";
			stmt.execute(sqlPrimo_2);
		}
		if(!primo_3.equals("")){
			String sqlPrimo_3 = "insert into amr.primo (nome, ID_menu) values (" + 
					"'" + primo_3 +
					"', '" + id +
					"')";
			stmt.execute(sqlPrimo_3);
		}
		
		String sqlSec_1 = "insert into amr.secondo (nome, ID_menu) values (" + 
				"'" + sec_1 +
				"', '" + id +
				"')";
		stmt.execute(sqlSec_1);
		if(!sec_2.equals("")){
			String sqlsec_2 = "insert into amr.secondo (nome, ID_menu) values (" + 
					"'" + sec_2 +
					"', '" + id +
					"')";
			stmt.execute(sqlsec_2);
		}
		if(!sec_3.equals("")){
			String sqlsec_3 = "insert into amr.secondo (nome, ID_menu) values (" + 
					"'" + sec_3 +
					"', '" + id +
					"')";
			stmt.execute(sqlsec_3);
		}
		String sqlCont_1 = "insert into amr.contorno (nome, ID_menu) values (" + 
				"'" + contorno_1 +
				"', '" + id +
				"')";
		stmt.execute(sqlCont_1);
		if(!contorno_2.equals("")){
			String sqlContorno_2 = "insert into amr.contorno (nome, ID_menu) values (" + 
					"'" + contorno_2 +
					"', '" + id +
					"')";
			stmt.execute(sqlContorno_2);
		}
		if(!contorno_3.equals("")){
			String sqlContorno_3 = "insert into amr.contorno (nome, ID_menu) values (" + 
					"'" + contorno_3 +
					"', '" + id +
					"')";
			stmt.execute(sqlContorno_3);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public static String getPiattiList(String tipo){
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "select nome from amr."+tipo+";";
		ArrayList<String> lists = new ArrayList<String>();
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(sqlQuery);
		    while(rs.next()){
		    	lists.add(rs.getString("nome"));
		    	
		    }
		     
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toJavascriptArray(lists);
	}
	
	public static String toJavascriptArray(ArrayList<String> arr){
	    StringBuffer sb = new StringBuffer();
	    sb.append("[");
	    for(int i=0; i<arr.size(); i++){
	        sb.append("\"").append(arr.get(i)).append("\"");
	        if(i+1 < arr.size()){
	            sb.append(",");
	        }
	    }
	    sb.append("]");
	    return sb.toString();
	}

	public static void addScelta(int id_utente, int id_menu, int id_primo, int id_secondo, int id_contorno) {
		Connection conn = getConnection();
		Statement stmt = null;	
		String sqlQuery = "insert into amr.sceltagiornaliera (ID_menu, ID_primo, ID_secondo, ID_contorno, ID_cliente) values ("+
					id_menu +
					", " + id_primo +
					", " + id_secondo +
					", " + id_contorno +
					", " + id_utente +
					")";

		try {
			stmt = conn.createStatement();
			stmt.execute(sqlQuery);   
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}
	
}
