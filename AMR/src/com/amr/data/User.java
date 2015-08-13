package com.amr.data;

public class User {
	
	private String nome;
	private String cognome;
	private String cf;
	private String residenza;
	private String email;
	private String pass;
	private boolean admin;
	
	public User(String nome, String cognome, String cf, String residenza, String email, String pass, boolean admin) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.cf = cf;
		this.residenza = residenza;
		this.email = email;
		this.pass = pass;
		this.admin = admin;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getCf() {
		return cf;
	}

	public void setCf(String cf) {
		this.cf = cf;
	}

	public String getResidenza() {
		return residenza;
	}

	public void setResidenza(String residenza) {
		this.residenza = residenza;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	
	
	
}
