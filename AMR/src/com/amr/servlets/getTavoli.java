package com.amr.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.Tavolo;
import com.amr.db.Connector;

/**
 * Servlet implementation class getTavoli
 */
@WebServlet("/getTavoli")
public class getTavoli extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getTavoli() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String giorno = request.getParameter("giorno");
		int fascia = Integer.parseInt(request.getParameter("fascia"));
		//System.out.println(idMenu + " " + idCliente);
		List<Tavolo> tavoli = Connector.getTavoliFromGiorno(giorno,fascia);
		if(tavoli.size()>0){
			String jsonString = createJson(tavoli);
			response.setContentType("text/plain"); 
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(jsonString); 
		}else{
			
		}
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String createJson(List<Tavolo> tavoli){
		String json = "{ \"tavoli\" : [ ";
		for(Tavolo t: tavoli){
			json = json + t.getJson() + ", ";
		}
		
		return json.substring(0, json.length() - 2) + "]}";
	}

}
