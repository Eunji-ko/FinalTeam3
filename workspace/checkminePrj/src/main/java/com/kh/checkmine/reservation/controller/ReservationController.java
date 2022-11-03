package com.kh.checkmine.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.reservation.service.ReservationService;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

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
	public String myreservation(Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		List<GoodsBookVo> voListGoods = rs.selectListGoods(no);
		List<PlaceBookVo> voListPlace = rs.selectListPlace(no);
		
		model.addAttribute("voListGoods", voListGoods);
		model.addAttribute("voListPlace", voListPlace);
		
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
