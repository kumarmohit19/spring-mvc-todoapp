package com.mohit.todo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TodoRestController {
	
	@Autowired
	private TodoService service;
	
	@RequestMapping(value ="/todos", method = RequestMethod.GET)
	public List<Todo> getTodos(){
		return service.retrieveTodos("user@google.com"); 
	}
	
	@RequestMapping(value ="/todos/{id}", method = RequestMethod.GET)
	public Todo getTodoById(@PathVariable("id") int id){
		return service.retrieveTodo(id); 
	}
}
