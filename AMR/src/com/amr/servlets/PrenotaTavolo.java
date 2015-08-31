package com.amr.servlets;

import java.io.IOException;
import java.util.ArrayList;

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
		
		String tav = request.getParameter("Tavoli");
		String fascia = request.getParameter("fascia");
		String data = request.getParameter("giorno");
		String orario = request.getParameter("ora");
		
		int id = Integer.parseInt(request.getParameter("userid"));
		Connector.prenotaTavolo(id, Integer.parseInt(tav), fascia, orario, data, 0); 
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
	
	private Tavolo getBest(ArrayList<Tavolo> tavoli, int numPers){
        Tavolo TM = new Tavolo();
        int  PostiMaxTav=0, differenza, minimo, id=0,MassPosti=0, MinPosti=0, massimo=0;
        ArrayList<Tavolo> tavoliMigliori = new ArrayList<Tavolo>();
        	 
        	 // calcola il numero massimo di posti di un tavolo più alto tra tutti
        	 for(Tavolo v : tavoli){
        		 if (v.getMax()> PostiMaxTav){
        			 PostiMaxTav = v.getMax();
        		 }
        	 }
        	 System.out.println(PostiMaxTav);
        	// calcola il numero massimo di posti (somma massimi)
    	 
        	 for(Tavolo v : tavoli){
        		 MassPosti+=v.getMax();	 
        	 }
        	 System.out.println(MassPosti);
        	 
        	 // calcola il numero minimo di posti  (somma minimi)
        	 for(Tavolo v : tavoli){
        		 MinPosti+=v.getMin();	 
        	 }
        	 System.out.println(MinPosti);
        	 
        	 // se il numero di persone è uguale al massimo di un tavolo
        	 for(Tavolo v: tavoli){
        		 if(numPers == v.getMax()){
        			 TM = v;
        			 System.out.println(TM.getNome());
        			 return TM;
        		 }
        	 }
        	 if(numPers < PostiMaxTav){
        		 for(Tavolo v : tavoli){
        			 if(numPers >= v.getMin() && numPers<v.getMax()){
        				 differenza = v.getMax() - numPers;
        				 v.setDiff(differenza);
        				 tavoliMigliori.add(v);
        			 }
        		 }
        		 minimo = 100;
        		 for(Tavolo v: tavoli){
        			 if(v.getDiff()< minimo){
        				 minimo= v.getDiff();
        				 id= v.getId();
        			 }	
        	
        		 }
        	 }
        	
        	 for(Tavolo v: tavoli)
        		 if(v.getId()==id)
        			 return v;

//        	 if(numPers > PostiMaxTav){
//        		 if(numPers == MassPosti){
//        			 for (Tavolo v: tavoli)
//        				 System.out.println(v.getNome());
//			
//        		 }
//        		 for(Tavolo v: tavoli){
//        			 if(v.getMax()>massimo){
//        				 massimo=v.getMax();
//        				 id=v.getId();
//        			 }
//        		 }
		
		
//        	 }
        	 return null;
		}

}
