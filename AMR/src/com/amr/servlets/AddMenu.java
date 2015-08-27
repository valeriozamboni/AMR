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
 * Servlet implementation class AddMenu
 */
@WebServlet("/AddMenu")
public class AddMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMenu() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date = request.getParameter("date");
	    String primo_1 = request.getParameter("primo_1");
	    String primo_2 = request.getParameter("primo_2");
	    String primo_3 = request.getParameter("primo_3");
	    String sec_1 = request.getParameter("sec_1");
	    String sec_2 = request.getParameter("sec_2");
	    String sec_3 = request.getParameter("sec_3");
	    String contorno_1 = request.getParameter("contorno_1");
	    String contorno_2 = request.getParameter("contorno_2");
	    String contorno_3 = request.getParameter("contorno_3");
	    //System.out.println(date + " " + primo_1 + " " + primo_2 + " " + primo_3 + " " + sec_1 + " " + sec_2 + " " + sec_3 + " "+ contorno_1 + " " + contorno_2 + " " + contorno_3);
	    Connector.addMenu(date, primo_1, primo_2, primo_3, sec_1, sec_2, sec_3, contorno_1, contorno_2, contorno_3);
	    RequestDispatcher view = request.getRequestDispatcher("result.jsp");
	    request.setAttribute("message", "Menu inserito con successo!");
	    view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
