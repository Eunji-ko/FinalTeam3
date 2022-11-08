package com.kh.checkmine.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.reservation.service.ReservationService;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
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
	
	//공유물 예약 취소
	@PostMapping("goodsDelbtn")
	@ResponseBody
	public String goodsDelbtn(@RequestBody GoodsBookVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String eNo = loginMember.getNo();
		
		vo.setENo(eNo);
		
		int result = rs.goodsDelbtn(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "예약이 취소 되었습니다.");
			return "redirect:/reservation/myreservation";
		}else {
			session.setAttribute("alertMsg", "예약 취소를 실패 하였습니다.");
			return "redirect:/reservation/myreservation";
		}
		
	}
	
	//장소 예약 취소
	@PostMapping("placeDelbtn")
	@ResponseBody
	public String placeDelbtn(@RequestBody PlaceBookVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getNo();
		
		vo.setEmpNo(empNo);
		
		int result = rs.placeDelbtn(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "예약이 취소 되었습니다.");
			return "redirect:/reservation/myreservation";
		}else {
			session.setAttribute("alertMsg", "예약 취소를 실패 하였습니다.");
			return "redirect:/reservation/myreservation";
		}
		
	}
	
	//빔프로젝트
	@GetMapping("goodsone/{pno}")
	public String goodsOne(@PathVariable int pno, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int bimrsvTotalCount = rs.bimrsvTotalCount();
		PageVo pv = Pagination.getPageVo(bimrsvTotalCount, pno, 5, 10);
		
		List<GoodsBookVo> rsvList = rs.selectListBimRsv(pv);
		List<GoodsVo> voList = rs.selectList();
		
		System.out.println(rsvList);
		
		model.addAttribute("rsvList", rsvList);
		model.addAttribute("voList", voList);
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		
		return "reservation/goodsone";
		
	}
	
	//빔 예약
	@PostMapping("rsvbtnb")
	@ResponseBody
	public String rsvbtnb(@RequestBody GoodsBookVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String eNo = loginMember.getNo();
		
		vo.setENo(eNo);
		
		int result = rs.insertRsvb(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "예약 성공!");
			return "redirect:/reservation/goodsone";
		}else {
			session.setAttribute("alertMsg", "예약 성공!");
			return "redirect:/reservation/goodsone";
		}
		
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
