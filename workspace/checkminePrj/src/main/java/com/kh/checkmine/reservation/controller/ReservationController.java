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
import com.kh.checkmine.reservation.vo.PlaceVo;

@Controller
@RequestMapping("reservation")
public class ReservationController {

	private final ReservationService rs;
	
	@Autowired
	public ReservationController(ReservationService rs) {
		this.rs = rs;
	}

	//나의 공유물 예약
	@GetMapping("mygoodsreservation/{pno}")
	public String mygoodsreservation(@PathVariable int pno, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int goodsrsvTotalCount = rs.goodsrsvTotalCount(no);
		PageVo pv = Pagination.getPageVo(goodsrsvTotalCount, pno, 5, 10);
		
		List<GoodsBookVo> voListGoods = rs.selectListGoods(no, pv);
		
		model.addAttribute("pv", pv);
		model.addAttribute("voListGoods", voListGoods);
		
		return "reservation/mygoodsreservation";
		
	}
	
	//나의 장소 예약
	@GetMapping("myplacereservation/{pno}")
	public String myplacereservation(@PathVariable int pno, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int placersvTotalCount = rs.placersvTotalCount(no);
		PageVo pv = Pagination.getPageVo(placersvTotalCount, pno, 5, 10);
		
		List<PlaceBookVo> voListPlace = rs.selectListPlace(no, pv);
		
		model.addAttribute("pv", pv);
		model.addAttribute("voListPlace", voListPlace);
		
		return "reservation/myplacereservation";
		
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
		List<GoodsVo> voBimList = rs.selectBimList();
		
		model.addAttribute("rsvList", rsvList);
		model.addAttribute("voBimList", voBimList);
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
	@GetMapping("goodstwo/{pno}")
	public String goodsTow(@PathVariable int pno, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int carrsvTotalCount = rs.carrsvTotalCount();
		PageVo pv = Pagination.getPageVo(carrsvTotalCount, pno, 5, 10);
		
		List<GoodsBookVo> rsvList = rs.selectListCarRsv(pv);
		List<GoodsVo> voCarList = rs.selectCarList();
		
		model.addAttribute("rsvList", rsvList);
		model.addAttribute("voCarList", voCarList);
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		
		return "reservation/goodstwo";
		
	}
	
	//차 예약
	@PostMapping("rsvbtnc")
	@ResponseBody
	public String rsvbtnc(@RequestBody GoodsBookVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String eNo = loginMember.getNo();
		
		vo.setENo(eNo);
		
		int result = rs.insertRsvc(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "예약 성공!");
			return "redirect:/reservation/goodstwo";
		}else {
			session.setAttribute("alertMsg", "예약 성공!");
			return "redirect:/reservation/goodstwo";
		}
		
	}
	
	//회의실
	@GetMapping("placeone/{pno}")
	public String placeOne(@PathVariable int pno, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int lirsvTotalCount = rs.lirsvTotalCount();
		PageVo pv = Pagination.getPageVo(lirsvTotalCount, pno, 5, 10);
		
		List<PlaceBookVo> rsvList = rs.selectListLiRsv(pv);
		List<PlaceVo> voLiList = rs.selectLiList();
		
		model.addAttribute("rsvList", rsvList);
		model.addAttribute("voLiList", voLiList);
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		
		return "reservation/placeone";
		
	}
	
	//회의실 예약
	@PostMapping("rsvbtnc")
	@ResponseBody
	public String rsvbtnc(@RequestBody PlaceBookVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getNo();
		
		vo.setEmpNo(empNo);
		
		int result = rs.insertRsvl(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "예약 성공!");
			return "redirect:/reservation/placeone";
		}else {
			session.setAttribute("alertMsg", "예약 성공!");
			return "redirect:/reservation/placeone";
		}
		
	}
	
	//응접실
	@GetMapping("placetwo")
	public String placeTwo() {
		return "reservation/placetwo";
	}
	
}
