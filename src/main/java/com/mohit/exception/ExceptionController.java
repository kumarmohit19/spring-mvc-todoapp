package com.mohit.exception;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
	
	private Log logger = LogFactory.getLog(ExceptionController.class);

	@ExceptionHandler(value= Exception.class)
	public String handleException(HttpServletRequest req, Exception ex){
		logger.error("Request " + req.getRequestURI() + " Threw an Exception", ex);
		return "error";
	}
}
