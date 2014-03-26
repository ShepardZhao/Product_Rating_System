/**
* This Servlet is implement initialing function 
* 
*
* @author  xun zhao
* @version 1.0
* @since   2014-03-21
*/
package com.Controller;
import java.io.StringWriter;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.*;

import static java.lang.System.*;

//Declare the class
public class Controller {
	private String[] ProductionList;
	private List<HashMap<String,String>>  l1 = new LinkedList<HashMap<String,String> >();

	//default constructor
	public Controller(){};
	// constructor 
	public Controller(String[] ProductionList){
	//constructor fetch info of products
		this.ProductionList = ProductionList;	
	}

	//return Url
	public static String getURLWithContextPath(HttpServletRequest request) {
		   return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		}

	
	//return json format
	@SuppressWarnings("unchecked")
	public String Returnsplit(){
		for(int i=0;i<ProductionList.length;i++){	
			l1.add(Setkey(ProductionList[i].split(",")));
		}
		
		return JSONValue.toJSONString(l1);

	}
	
	//set key for each function
	@SuppressWarnings("unchecked")
	private JSONObject Setkey(String[] string){
		JSONObject obj=new JSONObject();
		for(int x=0;x<string.length;x++){

			if(x==0){
				obj.put("id", string[x]);
			}
			if(x==1){
				obj.put("name",string[x]);
			}
			if(x==2){
				obj.put("price",string[x]);
			}
			if(x==3){
				obj.put("img",string[x]);
			}
			if(x==4){
				obj.put("color",string[x]);

			}
			if(x==5){
				obj.put("os",string[x]);

			}
			if(x==6){
				obj.put("processor",string[x]);

			}
			if(x==7){
				obj.put("momery",string[x]);

			}
			if(x==8){
				obj.put("storage",string[x]);
			}
		}

			return obj;
		
	}


	
	
	
	
	
	
	

}
