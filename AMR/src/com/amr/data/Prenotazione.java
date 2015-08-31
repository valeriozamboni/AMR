package com.amr.data;

public class Prenotazione {
	
	private int id;
	private String cliente;
	private String tavolo;
	private String giorno;
	private int fascia;
	private String orario;
	private int persone;
	
	public Prenotazione(int id, String cliente, String tavolo, String giorno, int fascia, String orario, int persone) {
		super();
		this.id = id;
		this.cliente = cliente;
		this.tavolo = tavolo;
		this.giorno = giorno;
		this.fascia = fascia;
		this.orario = orario;
		this.persone = persone;
	}
	
	public String getJson(){
		String json = "{\"id\": " + this.id + 
				", \"cliente\" : \"" + this.cliente + "\" "+
				", \"tavolo\" : \"" + this.tavolo + "\" "+
				", \"giorno\" : \"" + this.giorno + "\" "+	
				", \"fascia\" : " + this.fascia + " "+
				", \"orario\" : \"" + this.orario + "\" "+	
				", \"persone\" : " + this.persone + " "+
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

	public String getId_cliente() {
		return cliente;
	}

	public void setId_cliente(String id_cliente) {
		this.cliente = id_cliente;
	}

	public String getTavolo() {
		return tavolo;
	}

	public void setTavolo(String tavolo) {
		this.tavolo = tavolo;
	}

	public String getGiorno() {
		return giorno;
	}

	public void setGiorno(String giorno) {
		this.giorno = giorno;
	}

	public int getFascia() {
		return fascia;
	}

	public void setFascia(int fascia) {
		this.fascia = fascia;
	}

	public String getOrario() {
		return orario;
	}

	public void setOrario(String orario) {
		this.orario = orario;
	}

	public int getPersone() {
		return persone;
	}

	public void setPersone(int persone) {
		this.persone = persone;
	}
	
	
	

}
