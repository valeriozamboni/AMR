package com.amr.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.Menu;
import com.amr.data.Scelta;
import com.amr.db.Connector;

/**
 * Servlet implementation class GetScelta
 */
@WebServlet("/GetScelta")
public class GetScelta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetScelta() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idMenu = Integer.parseInt(request.getParameter("idMenu"));
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		//System.out.println(idMenu + " " + idCliente);
		Scelta scelta = Connector.getScelta(idMenu,idCliente);
	    
		String res = "";
	    
		if(scelta!=null){
	    	res = scelta.getJson();
	    }
	    //System.out.println(res);
	    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    response.getWriter().write(res);       // Write response body.

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
