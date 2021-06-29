package com.spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store")
public class StoreController {

    @GetMapping("/myStore")
    public void myStore() {
       
    }
    @GetMapping("/enrollMenu")
    public void enrollMenu() {
       
    }
    @GetMapping("/menuList")
    public void menuList() {
       
    }
    @GetMapping("/menuDetail")
    public void menuDetail() {
       
    }
    @GetMapping("/modifyMenu")
    public void modifyMenu() {
       
    }

}
