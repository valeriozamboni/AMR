package com.amr.data;

public class Azienda {
	
	private int id;
	private String nome;
	private String cod;

	public Azienda(int id, String nome, String cod) {
		this.id=id;
		this.nome = nome;
		this.cod = cod;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	

}
