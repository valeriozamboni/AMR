package com.amr.data;

import java.util.ArrayList;


public class Menu {
	
	private String date;
	private int id;
	private ArrayList<Piatto> primi;
	private ArrayList<Piatto> secondi;
	private ArrayList<Piatto> contorni;
	
	public Menu(String date){
		this.date = date;
		this.id = -1;
		this.primi = new ArrayList<Piatto>();
		this.secondi = new ArrayList<Piatto>();
		this.contorni = new ArrayList<Piatto>();
	}
	

	public Menu(String date, int id){
		this.date = date;
		this.id = id;
		this.primi = new ArrayList<Piatto>();
		this.secondi = new ArrayList<Piatto>();
		this.contorni = new ArrayList<Piatto>();
	}
	
	public String getDate(){
		return this.date;
	}
	public void addPrimo(int id,String primo){
		this.primi.add(new Piatto(id,primo));
	}
	public void addSecondo(int id,String secondo){
		this.secondi.add(new Piatto(id,secondo));
	}
	public void addContorno(int id,String contorno){
		this.contorni.add(new Piatto(id,contorno));
	}

	public ArrayList<Piatto> getPrimi() {
		return primi;
	}

	public ArrayList<Piatto> getSecondi() {
		return secondi;
	}

	public ArrayList<Piatto> getContorni() {
		return contorni;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getJson(){
		
		String json = "{\"id\": " + 
						this.id + 
						", \"giorno\" : \"" + this.date + "\" "+
						", \"primi\" : [ " + 
						getPrimiJson() + 
						" ], \"secondi\" : [ " + 
						getSecondiJson() + 
						" ], \"contorni\" : [ " + 
						getContorniJson() + 
						" ]}"
						;
		return json;
	}
	
	private String getPrimiJson(){
		String json = "";
		for(Piatto p: primi){
			json = json + "{ \"id\": " + p.getId() + ", \"nome\": \"" + p.getNome() + "\"},";
		}
		
		return json.substring(0, json.length() - 1);
	}
	
	private String getSecondiJson(){
		String json = "";
		for(Piatto p: secondi){
			json = json + "{ \"id\": " + p.getId() + ", \"nome\": \"" + p.getNome() + "\"},";
		}
		
		return json.substring(0, json.length() - 1);
	}
	
	private String getContorniJson(){
		String json = "";
		for(Piatto p: contorni){
			json = json + "{ \"id\": " + p.getId() + ", \"nome\": \"" + p.getNome() + "\"},";
		}
		
		return json.substring(0, json.length() - 1);
	}
	

}
