package com.kh.checkmine.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmine.admin.service.AdminGoodsService;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

@Controller
@RequestMapping("admin/goods")
public class AdminGoodsController {
	
	private final AdminGoodsService service;

	public AdminGoodsController(AdminGoodsService service) {
		this.service = service;
	}
	
	//공유물 리스트
	@GetMapping("list")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "p") String sort, Model model) {
		
		//페이지 처리를 위한 토탈
		int totalCount = service.selectTotalCnt(sort);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		
		if("p".equals(sort)) {
			List<PlaceVo> goodsList = service.selectPlaceList(pv, sort);	
			model.addAttribute("goodsList", goodsList);
		}else {
			List<GoodsVo> goodsList = service.selectGoodsList(pv, sort);
			model.addAttribute("goodsList", goodsList);
		}
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);

		return "admin/adminGoods";
	}

}
