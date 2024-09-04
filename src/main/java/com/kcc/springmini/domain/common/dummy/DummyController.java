package com.kcc.springmini.domain.common.dummy;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
public class DummyController {
    private final DummyService dummyService;

    @PostMapping("/dummy")
    public void dummy(MultipartFile file) {
        try {
            dummyService.saveFile(file);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
