package com.amr.data;

public class Azienda {
	
	private String nome;
	private String cod;

	public Azienda(String nome, String cod) {
		super();
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
	
	

}
