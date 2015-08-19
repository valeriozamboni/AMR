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
 * Servlet implementation class AddSceltaGiornaliera
 */
@WebServlet("/AddSceltaGiornaliera")
public class AddSceltaGiornaliera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSceltaGiornaliera() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_primo = Integer.parseInt(request.getParameter("selprimo"));    
	    int id_secondo = Integer.parseInt(request.getParameter("selsecondo"));    
	    int id_contorno = Integer.parseInt(request.getParameter("selcontorno"));
	    int id_menu = Integer.parseInt(request.getParameter("menuid"));
	    int id_utente = Integer.parseInt(request.getParameter("userid"));;
	    //System.out.println(id_primo + " " + id_secondo + " " + id_contorno + " " + id_menu + " " + id_utente);
	    Connector.addScelta(id_utente, id_menu, id_primo, id_secondo, id_contorno);
	    RequestDispatcher view = request.getRequestDispatcher("result.jsp");
	    request.setAttribute("message", "Scelta effettuata con successo!");
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
