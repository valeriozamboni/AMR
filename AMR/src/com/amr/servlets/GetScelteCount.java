package com.amr.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.CountScelte;
import com.amr.db.Connector;

/**
 * Servlet implementation class GetScelteCount
 */
@WebServlet("/GetScelteCount")
public class GetScelteCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetScelteCount() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
			String data = request.getParameter("date");
			String id = request.getParameter("id");
			CountScelte scelte = null;
			if(id!=null && !id.equals("")){
				scelte = Connector.getCountByUser(data, Integer.parseInt(id));
			}else{
				scelte = Connector.getCountPiatti(data);
			}
			
			 
			String res = "";
		    
			if(scelte.isNotEmpty() && scelte != null){
		    	res = scelte.getJson();
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
