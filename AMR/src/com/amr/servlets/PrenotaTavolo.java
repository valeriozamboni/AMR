package com.amr.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.Tavolo;
import com.amr.db.Connector;

/**
 * Servlet implementation class PrenotaTavolo
 */
@WebServlet("/PrenotaTavolo")
public class PrenotaTavolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrenotaTavolo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] tav = request.getParameterValues("Tavoli[]");
		
		String fascia = request.getParameter("fascia");
		String data = request.getParameter("giorno");
		String orario = request.getParameter("orario");
		int num = Integer.parseInt(request.getParameter("persone"));
		int id = Integer.parseInt(request.getParameter("userid"));
		int min = 0;
		int max = 0;
		for(String t: tav){
			Tavolo mT = Connector.getTavoloFromId( Integer.parseInt(t));
			
		}
		
				
		
		for(String t: tav){
			Connector.prenotaTavolo(id, Integer.parseInt(t), fascia, orario, data, num); 
		}
		
		RequestDispatcher view = request.getRequestDispatcher("result.jsp");
	    request.setAttribute("message", "Tavolo prenotato con successo!");
	    view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
