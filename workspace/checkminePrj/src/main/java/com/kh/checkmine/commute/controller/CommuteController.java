package com.kh.checkmine.commute.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.commute.service.CommuteService;
import com.kh.checkmine.commute.vo.CommuteVo;

@Controller
@RequestMapping("commute")
public class CommuteController {

	private final CommuteService cs;
	
	public CommuteController(CommuteService cs) {
		this.cs = cs;
	}

	//나의 근태기록
	@GetMapping("mycommute")
	public String mycommute(Model model) {
		
		List<CommuteVo> cVo = cs.selectList();
		
		model.addAttribute("cVo", cVo);
		
		return "commute/mycommute";
		
	}
	
	//전체 근태기록
	@GetMapping("commute")
	public String commute() {
		return "commute/commute";
	}
	
	//연차신청
	@GetMapping("leave")
	public String leave() {
		return "commute/leave";
	}
	
}
