package com.kh.checkmine.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.reservation.service.ReservationService;

@Controller
@RequestMapping("reservation")
public class ReservationController {

	private final ReservationService rs;
	
	@Autowired
	public ReservationController(ReservationService rs) {
		this.rs = rs;
	}

	//나의 예약
	@GetMapping("myreservation")
	public String myreservation() {
		return "reservation/myreservation";
	}
	
	//빔프로젝트
	@GetMapping("goodsone")
	public String goodsOne() {
		return "reservation/goodsone";
	}
	
	//법인차
	@GetMapping("goodstwo")
	public String goodsTwo() {
		return "reservation/goodstwo";
	}
	
	//회의실
	@GetMapping("placeone")
	public String placeOne() {
		return "reservation/placeone";
	}
	
	//응접실
	@GetMapping("placetwo")
	public String placeTwo() {
		return "reservation/placetwo";
	}
	
}
