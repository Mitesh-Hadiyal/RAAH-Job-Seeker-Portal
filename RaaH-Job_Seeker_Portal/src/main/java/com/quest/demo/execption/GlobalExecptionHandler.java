package com.quest.demo.execption;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExecptionHandler {

	@ExceptionHandler(ResourceNotFoundException.class)
	public ResponseEntity<?> ResourceNotFoundExecption(ResourceNotFoundException ex) {

		String message = ex.getMessage();

		return new ResponseEntity<>(message, HttpStatus.NOT_FOUND);

	}
	
	@ExceptionHandler(RuntimeException.class)
	public ResponseEntity<?> handleMethodArgumentNotValidException(RuntimeException ex){
		Map<String, String> map = new HashMap<>();
		
		String message = ex.getMessage();
		/*ex.getBindingResult().getAllErrors().forEach((error)->{
			String field = ((FieldError)error).getField();
			String defaultMessage = error.getDefaultMessage();
			map.put(field, defaultMessage);*/
		return new ResponseEntity<String>(message,HttpStatus.BAD_REQUEST);
	
}
}
