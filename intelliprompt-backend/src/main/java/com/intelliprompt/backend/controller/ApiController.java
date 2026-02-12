package com.intelliprompt.backend.controller;

@RestController
@RequestMapping("/api")
public class ApiController {
    
    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}
