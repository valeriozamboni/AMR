package com.amr.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.User;
import com.amr.db.Connector;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
 
		String email = request.getParameter("loginEmail");
	    String pass = request.getParameter("loginPassword");
	    
	    User user = Connector.getUserFromCredentials(email, pass);
   
	    if(user == null){
	    RequestDispatcher view = request.getRequestDispatcher("login.jsp");
	    request.setAttribute("error", true);
		    view.forward(request, response);
	    }else{
	    	request.setAttribute("user", user);
		    RequestDispatcher view = request.getRequestDispatcher("home.jsp");
		    view.forward(request, response);
	    }
	    
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
	}
}
