package com.amr.data;

public class Scelta {
	
	private int id;
	private int idMenu;
	private int idCliente;

	private Piatto primo;
	private Piatto secondo;
	private Piatto contorno;
	

	public Scelta(int id, int idMenu, int idCliente){
		this.id=id;
		this.idMenu = idMenu;
		this.idCliente=idCliente;
		this.primo=null;
		this.secondo=null;
		this.contorno=null;
		
	}

	public Scelta(int id, int idMenu, int idCliente, Piatto primo, Piatto secondo, Piatto contorno) {
		this.id = id;
		this.idMenu = idMenu;
		this.idCliente = idCliente;
		this.primo = primo;
		this.secondo = secondo;
		this.contorno = contorno;
	}




	public String getJson(){
		
		String json = "{\"id\": " + this.id + " " +
						", \"idMenu\" : " + this.idMenu + " " +
						", \"idCliente\" : " + this.idCliente + " " +		
						" , \"primo\" : { \"id\" : " + primo.getId() + ", \"nome\" : \"" + primo.getNome() + "\" }" + 
						" , \"secondo\" : { \"id\" : " + secondo.getId() + ", \"nome\" : \"" + secondo.getNome() + "\" }" + 
						" , \"contorno\" : { \"id\" : " + contorno.getId() + ", \"nome\" : \"" + contorno.getNome() + "\" }" +
						"}";
		return json;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdMenu() {
		return idMenu;
	}

	public void setIdMenu(int idMenu) {
		this.idMenu = idMenu;
	}


	public int getIdCliente() {
		return idCliente;
	}


	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}


	public Piatto getPrimo() {
		return primo;
	}


	public void setPrimo(Piatto primo) {
		this.primo = primo;
	}


	public Piatto getSecondo() {
		return secondo;
	}


	public void setSecondo(Piatto secondo) {
		this.secondo = secondo;
	}


	public Piatto getContorno() {
		return contorno;
	}


	public void setContorno(Piatto contorno) {
		this.contorno = contorno;
	}

	
	
	

}
