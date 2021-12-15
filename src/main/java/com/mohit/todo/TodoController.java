package com.mohit.todo;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mohit.exception.ExceptionController;

@Controller
@SessionAttributes("email")
public class TodoController {
	
	@Autowired
	private TodoService todoService; 
	
	private Log logger = LogFactory.getLog(ExceptionController.class);
	
	@InitBinder
	protected void initBinder(WebDataBinder  binder){
		SimpleDateFormat dateFormat= new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping(value = "/list-todos", method= RequestMethod.GET)
	public String showLoginPage(ModelMap model){
		model.put("todos", todoService.retrieveTodos(retriveLoggedinUserName()));
		return "list-todos";
		
	}

	private String retriveLoggedinUserName() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		if (principal instanceof UserDetails)
			return ((UserDetails) principal).getUsername();

		return principal.toString();
	}

	
	@RequestMapping(value = "/add-todo", method= RequestMethod.GET)
	public String showTodoPage(Model model){
		throw new RuntimeException("Dummy Exception");
		/*model.addAttribute("todo", new Todo());
		return "todo";*/	
	}
	
	@RequestMapping(value = "/add-todo", method= RequestMethod.POST)
	public String addNewTodo(ModelMap model, @Valid @ModelAttribute Todo todo, BindingResult result){
		if(result.hasErrors()){
			return "todo";
		}
		todoService.addTodo(retriveLoggedinUserName(), todo.getDesc(), new Date(), false);
		model.clear(); // used to clear params in url
		return "redirect:list-todos";	//redirect to different controller
	}
	
	@RequestMapping(value = "/update-todo", method= RequestMethod.GET)
	public String updateTodo(Model model, @RequestParam int id){
		Todo todo= todoService.retrieveTodo(id);
		model.addAttribute("todo", todo);
		return "todo";	
	}
	
	@RequestMapping(value = "/update-todo", method= RequestMethod.POST)
	public String updateTodo(ModelMap model, @Valid @ModelAttribute Todo todo, BindingResult result){
		if(result.hasErrors()){
			return "todo";
		}
		todo.setUser(retriveLoggedinUserName());//TODO: Remove Hardcoding later
		todoService.updateTodo(todo);
		
		model.clear(); // used to clear params in url
		return "redirect:list-todos";	//redirect to different controller
	}
	
	@RequestMapping(value = "/delete-todo", method= RequestMethod.GET)
	public String deleteTodo(ModelMap model, @RequestParam int id){
		todoService.deleteTodo(id);
		model.clear(); 
		return "redirect:list-todos";//redirect to different controller
	}
	
	@ExceptionHandler(value= Exception.class)
	public String handleException(HttpServletRequest req, Exception ex){
		logger.error("Request " + req.getRequestURI() + " Threw an Exception", ex);
		return "error-specific";
	}
	
}
