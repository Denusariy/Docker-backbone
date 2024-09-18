package ru.denusariy.docker_backbone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.denusariy.docker_backbone.domain.Answer;
import ru.denusariy.docker_backbone.service.AnswerService;

@RestController
@RequestMapping("/api")
public class MainController {

    private final AnswerService answerService;

    @Autowired
    public MainController(AnswerService answerService) {
        this.answerService = answerService;
    }

    @GetMapping(value = "/healthcheck", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Answer> getAnswer() {
        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(answerService.getAnswer());
    }
}
