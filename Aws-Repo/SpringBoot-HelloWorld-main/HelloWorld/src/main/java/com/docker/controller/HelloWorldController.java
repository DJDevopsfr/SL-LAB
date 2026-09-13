package com.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

	@RequestMapping("/hello")
	public String sayHello() {
		return "hello, my name is rakesh";
	}
	
	@GetMapping("/say/{name}")
	public String sayName(@PathVariable String name) {
		return name;
	}
	
}
