package com.spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/main")
    public void main() {
       
    }
    @GetMapping("/store")
    public void store() {
       
    }
    @GetMapping("/recommend")
    public void recommend() {
       
    }
    @GetMapping("/map")
    public void map() {
       
    }
}
