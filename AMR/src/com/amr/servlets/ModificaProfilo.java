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
 * Servlet implementation class ModificaServlet
 */
@WebServlet("/ModificaProfilo")
public class ModificaProfilo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaProfilo() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
	    String oldpass = request.getParameter("pwd");
	    String nome = request.getParameter("nome");
	    String cognome = request.getParameter("cognome");
	    String cf = request.getParameter("cf");
	    String res = request.getParameter("residenza");
	    String oldemail = request.getParameter("oldemail");
	    String newpass = request.getParameter("new_pwd");
	    	    
	    if(newpass.equals("")){
	    	newpass = oldpass;
	    }
	    
	    User user =  Connector.modifyUser(oldemail, oldpass, email, newpass, nome, cognome, cf, res, false);
	    
	    request.setAttribute("user", user);
	    request.setAttribute("message", "Proflio modificato con successo!");
	    RequestDispatcher view = request.getRequestDispatcher("result.jsp");
	    view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
