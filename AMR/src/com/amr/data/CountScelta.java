package com.amr.data;

public class CountScelta {
	
	private String nome;
	private int count;
	
	
	
	public CountScelta(String nome, int count) {
		super();
		this.nome = nome;
		this.count = count;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public String getJson(){

		return "{ \"nome\" : " + "\"" + this.nome + "\", \"count\": " + this.count + "}";
		
	}
	
	
}
