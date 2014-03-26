package com.Controller;
import javax.servlet.http.*;

import java.util.*;

public class SessionController {
	protected HttpSession session;
	public String userSession;
	public SessionController(HttpSession session){
		this.session = session;
	}
	
	
	 //return condition of current session 
	protected boolean CheckSession(String sessionName){
		if(this.session.getAttribute(sessionName)==null){
			return true;
		}
		else{
			return false;
		}
		
	}

	
	

	//get session by name
	@SuppressWarnings("unchecked")
	protected HashMap<String,HashMap<Integer,Integer>> getSessionName(String name){
		
		return (HashMap<String, HashMap<Integer, Integer>>) this.session.getAttribute(name);
		
		
	}



}
