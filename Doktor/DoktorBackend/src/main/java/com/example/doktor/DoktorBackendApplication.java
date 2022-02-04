package com.example.doktor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("model")
public class DoktorBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(DoktorBackendApplication.class, args);
	}

}
