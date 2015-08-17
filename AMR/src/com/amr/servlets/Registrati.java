package com.amr.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amr.data.User;
import com.amr.db.Connector;

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/Registrati")
public class Registrati extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrati() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("inputEmail");
	    String pass = request.getParameter("inputPassword");
	    String nome = request.getParameter("inputNome");
	    String cognome = request.getParameter("inputCognome");
	    String cf = request.getParameter("inputCF");
	    String res = request.getParameter("inputResidenza");
	    
	    User user =  Connector.registerUser(email, pass, nome, cognome, cf, res, false);
	    
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
		doGet(request, response);
	}

}
