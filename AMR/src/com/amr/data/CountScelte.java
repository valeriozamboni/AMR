package com.amr.data;

import java.util.ArrayList;

public class CountScelte {

	private ArrayList<CountScelta> primi;
	private ArrayList<CountScelta> secondi;
	private ArrayList<CountScelta> contorni;
	
	public CountScelte(){
		this.primi = new ArrayList<CountScelta>();
		this.secondi = new ArrayList<CountScelta>();
		this.contorni = new ArrayList<CountScelta>();
	}
	public CountScelte(ArrayList<CountScelta> primi, ArrayList<CountScelta> secondi, ArrayList<CountScelta> contorni){
		this.primi = primi;
		this.secondi = secondi;
		this.contorni = contorni;
	}
	
	public void addPrimo(String nome, int count){
		this.primi.add(new CountScelta(nome,count));
	}
	public void addSecondo(String nome, int count){
		this.secondi.add(new CountScelta(nome,count));
	}
	public void addContorno(String nome, int count){
		this.contorni.add(new CountScelta(nome,count));
	}
	public void addPrimo(CountScelta scelta){
		this.primi.add(scelta);
	}
	public void addSecondo(CountScelta scelta){
		this.secondi.add(scelta);
	}
	public void addContorno(CountScelta scelta){
		this.contorni.add(scelta);
	}

	public ArrayList<CountScelta> getPrimi() {
		return primi;
	}
	public void setPrimi(ArrayList<CountScelta> primi) {
		this.primi = primi;
	}
	public ArrayList<CountScelta> getSecondi() {
		return secondi;
	}
	public void setSecondi(ArrayList<CountScelta> secondi) {
		this.secondi = secondi;
	}
	public ArrayList<CountScelta> getContorni() {
		return contorni;
	}
	public void setContorni(ArrayList<CountScelta> contorni) {
		this.contorni = contorni;
	}
	
	public boolean isNotEmpty(){
		return (this.contorni.size() > 0 && this.secondi.size() > 0 && this.primi.size() > 0);
	}
	
	public String getJson(){
		
		String json = "{ \"primi\" : [ ";
		
		for(CountScelta pr: this.primi){
			json = json + pr.getJson()+ ", ";
		}
		json = json.substring(0, json.length() - 2) + "], \"secondi\" : [ ";
		for(CountScelta pr: this.secondi){
			json = json + pr.getJson()+ ", ";
		}
		json = json.substring(0, json.length() - 2) + "], \"contorni\" : [ ";
		for(CountScelta pr: this.contorni){
			json = json + pr.getJson()+ ", ";
		}
		
		return json.substring(0, json.length() - 2) + "]}";

	}
	
	
}
