package com.example.appointment_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class AppointmentAppApplication {
	public static void main(String[] args) {
		SpringApplication.run(AppointmentAppApplication.class, args);
	}

	@RequestMapping(value = "/")
	public String hello() {
		return "Hello!!!";
	}
}
