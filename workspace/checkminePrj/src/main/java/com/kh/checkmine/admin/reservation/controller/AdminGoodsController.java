package com.kh.checkmine.admin.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.checkmine.admin.reservation.service.AdminGoodsService;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

/*
 * 관리자 > 공유물 관리
*/
@Controller
@RequestMapping("admin/goods")
public class AdminGoodsController {
	
	private final AdminGoodsService service;

	public AdminGoodsController(AdminGoodsService service) {
		this.service = service;
	}
	
	//공유물 리스트 (장소 / 공유물 정렬)
	@GetMapping("list")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "p") String sort, Model model) {
		
		//페이지 처리를 위한 토탈
		int totalCount = service.selectTotalCnt(sort);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);
		
		if("p".equals(sort)) {
			List<PlaceVo> goodsList = service.selectPlaceList(pv, sort);	
			model.addAttribute("goodsList", goodsList);	
			return "admin/reservation/placeList";
		}else {
			List<GoodsVo> goodsList = service.selectGoodsList(pv, sort);
			model.addAttribute("goodsList", goodsList);
			return "admin/reservation/goodsList";
		}
	}
	
	//예약 리스트
	@PostMapping(value = "book", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String bookList(@RequestParam String no, @RequestParam String sort) {
		Gson g = new Gson();
		String str = "";
		if("p".equals(sort)) {
			List<PlaceBookVo> bookList = service.selectPlaceBook(no);
			str = g.toJson(bookList);
		}else {
			List<GoodsBookVo> bookList = service.selectGoodsBook(no);
			str = g.toJson(bookList);
		}
		return str;
	}
	
	
	//선택 삭제
	@PostMapping("delete")
	@ResponseBody
	public String delete(@RequestParam(value="checkArr[]") ArrayList<String> checkArr, @RequestParam String sort, HttpSession session) {
		if("p".equals(sort)) {
			 for(int i = 0; i < checkArr.size(); i++) { 
				 int result = service.deletePlace(checkArr.get(i));
			 if(result == -1) { 
				 session.setAttribute("msg", "오류가 발생하였습니다."); 
				 return "fail"; 
				 }
			 }
			 
		 }else {
			 for(int i = 0; i < checkArr.size(); i++) { 
				 int result = service.deleteGoods(checkArr.get(i));
				 if(result == -1) { 
					 session.setAttribute("msg", "오류가 발생하였습니다."); 
					 return "fail"; 
				 }
			 } 
		 }
		 
		return "ok";		
	}

	//공유물 등록 페이지
	@GetMapping("add")
	public String add() {
		return "admin/reservation/add";
	}
	
	//공유물 등록
	@PostMapping("add")
	public String add(@RequestParam HashMap<String, String> map, HttpSession session) {
		
		int result = service.addList(map);

		if(result == 1) {
			session.setAttribute("msg", "정상적으로 등록되었습니다.");
		}else {
			session.setAttribute("msg", "오류가 발생하였습니다.");
		}
		
		return "redirect:/admin/goods/list";
	}

	//공유물 검색 - 공유물
	@GetMapping("searchGoods")
	public String searchGoods(@RequestParam(value = "p", defaultValue = "1") int pno,  @RequestParam String option, @RequestParam String keyword, Model model) {
		HashMap<String, String> map = new HashMap<>(2);
		map.put("option", option);
		map.put("keyword", keyword);
		
		int totalCount = service.selectKeywordGoodsCnt(map);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		List<GoodsVo> goodsList = service.selectGoodsKeyword(pv, map);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("pv", pv);
		model.addAttribute("map", map);
		
		return "admin/reservation/goodsSearch";
	}
	
	//공유물 검색 - 장소
	@GetMapping("searchPlace")
	public String searchPlace(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam String option, @RequestParam String keyword, Model model) {
		HashMap<String, String> map = new HashMap<>(2);
		map.put("option", option);
		map.put("keyword", keyword);
		
		int totalCount = service.selectKeywordPlaceCnt(map);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		List<PlaceVo> goodsList = service.selectPlaceKeyword(pv, map);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("pv", pv);
		model.addAttribute("map", map);
		
		return "admin/reservation/placeSearch";
		
	}
}
