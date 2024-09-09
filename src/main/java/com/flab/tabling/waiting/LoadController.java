package com.flab.tabling.waiting;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class LoadController {

	private final WaitingAddLoadTestAsync waitingAddLoadTestAsync;

	@GetMapping("/load")
	public void test() {
		waitingAddLoadTestAsync.runAsyncTest(1);
	}
}
