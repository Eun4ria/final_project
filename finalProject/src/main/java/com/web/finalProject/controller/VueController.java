package com.web.finalProject.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VueController {
	// http://localhost:4040/vueStart
	@GetMapping("vueStart")
	public String vueStart() {
		return "a01_vue_boot.html";
	}
	// http://localhost:4040/vue_axios04
	@GetMapping("vue_axios04")
	public ResponseEntity<String> ajax04(){
		return ResponseEntity.ok("아릉하세연");
	}
}
