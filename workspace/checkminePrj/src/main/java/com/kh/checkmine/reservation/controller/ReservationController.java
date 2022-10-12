package com.kh.checkmine.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("reservation")
public class ReservationController {

	@GetMapping("myreservation")
	public String myreservation() {
		return "reservation/myreservation";
	}
	
	@GetMapping("goodsone")
	public String goodsOne() {
		return "reservation/goodsone";
	}
	
}
