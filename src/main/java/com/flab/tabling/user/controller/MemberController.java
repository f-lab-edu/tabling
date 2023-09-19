package com.flab.tabling.user.controller;

import com.flab.tabling.user.dto.MemberDto;
import com.flab.tabling.user.service.UserRegisterService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class MemberController {
    private final UserRegisterService userRegisterService;

    @PostMapping("/user")
    private void save(@Valid @RequestBody MemberDto memberDto) {
        userRegisterService.save(memberDto);
    }

}
