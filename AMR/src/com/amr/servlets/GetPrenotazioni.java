package com.amr.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.Prenotazione;
import com.amr.data.Tavolo;
import com.amr.db.Connector;

/**
 * Servlet implementation class GetPrenotazioni
 */
@WebServlet("/GetPrenotazioni")
public class GetPrenotazioni extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPrenotazioni() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("date");
		String fascia = request.getParameter("fascia");
		List<Prenotazione> pren = null;
		
		if(fascia!=null && !fascia.equals("")){
			pren = Connector.getPrenotazioniFromGiornoAndFascia(data, Integer.parseInt(fascia));
		}else{
			pren = Connector.getPrenotazioniFromGiorno(data);
		}
		
		 
		String res = "";
	    
		if(!pren.isEmpty() && pren != null){
	    	res = "{ \"prenotazioni\" : [ ";
	    	for(Prenotazione p: pren){
	    		res = res + p.getJson() + ", ";
	    	}
	    	res = res.substring(0, res.length() -2) + "]}";
	    }
		
		
		//System.out.println(res);
	    response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8"); 
	    response.getWriter().write(res); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	

}
