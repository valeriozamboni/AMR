package com.amr.data;

public class Tavolo {
	
	private int id;
	private String nome;
	private int min;
	private int max;
	private int diff;
	
	public Tavolo(){
		
	}
	
	public Tavolo(int id, String nome, int min, int max, int diff) {
		super();
		this.id = id;
		this.nome = nome;
		this.min = min;
		this.max = max;
	}
	
public String getJson(){
		
		String json = "{\"id\": " + this.id + 
						", \"nome\" : \"" + this.nome + "\" "+
						", \"min\" : " + this.min + " "+
						", \"max\" : " + this.max + " "+						
						"}"
						;
		return json;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}

	public int getDiff() {
		return diff;
	}

	public void setDiff(int diff) {
		this.diff = diff;
	}
	
	
	

}
