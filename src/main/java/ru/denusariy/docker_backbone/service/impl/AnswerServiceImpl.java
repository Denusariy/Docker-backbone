package ru.denusariy.docker_backbone.service.impl;

import org.springframework.stereotype.Service;
import ru.denusariy.docker_backbone.domain.Answer;
import ru.denusariy.docker_backbone.service.AnswerService;

@Service
public class AnswerServiceImpl implements AnswerService {
    @Override
    public Answer getAnswer() {
        return new Answer(1, "pong");
    }
}
