package com.flab.tabling.member.controller;

import org.springframework.web.bind.annotation.RestController;

// import com.flab.tabling.global.util.Login;
// import com.flab.tabling.global.util.MemberInfo;
// import com.flab.tabling.member.exception.MemberExistException;

@RestController
public class TempController {
	// @GetMapping("/test/{value}")
	// public ResponseEntity<String> test(@PathVariable Integer value, @Login MemberInfo memberInfo) {
	// 	System.out.println("value = " + value);
	// 	System.out.println("memberInfo = " + memberInfo.getId());
	// 	if (value == 2) {
	// 		throw new MemberExistException();
	// 	}
	// 	return new ResponseEntity<>("부모 클래스", HttpStatus.OK);
	// }
	//
	// // @ExceptionHandler(value = MemberExistException.class)
	// // public ResponseEntity<String> invokeError(MemberExistException e) {
	// // 	return new ResponseEntity<>("부모 클래스", HttpStatus.BAD_REQUEST);
	// // }
}
