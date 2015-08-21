package com.amr.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.db.Connector;

/**
 * Servlet implementation class AggTavolo
 */
@WebServlet("/AddTavolo")
public class AddTavolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTavolo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
	    int postiMin = Integer.parseInt(request.getParameter("PostiMin"));
	    int postiMax = Integer.parseInt(request.getParameter("PostiMax"));
	    
	    Connector.addTavolo(nome,postiMin,postiMax);
	    RequestDispatcher view = request.getRequestDispatcher("result.jsp");
	    request.setAttribute("message", "Tavolo inserito con successo!");
	    view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
