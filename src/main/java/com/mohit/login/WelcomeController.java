package com.mohit.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
//@SessionAttributes("email")
public class WelcomeController {
	
	/*@Autowired
	LoginService loginService; */
	
	@RequestMapping(value = "/", method= RequestMethod.GET)
	public String showLoginPage(ModelMap model){
		model.put("name", "user@google.com");
		return "welcome";
		
	}
	
	/*@RequestMapping(value = "/login", method= RequestMethod.POST)
	public String handleLoginRequest(@RequestParam String email,@RequestParam String password, ModelMap model){
		if(loginService.validateUser(email, password)){
			model.put("email", email);
			model.put("password", password);
			return "welcome";
		}else{
			model.put("error",  "Invalid Credentials!");
			return "login";
		}
		
	}*/
}
