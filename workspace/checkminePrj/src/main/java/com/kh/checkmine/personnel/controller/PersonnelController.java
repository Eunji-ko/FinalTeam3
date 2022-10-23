package com.kh.checkmine.personnel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.service.PersonnelService;
import com.kh.checkmine.personnel.vo.AccountVo;

@Controller
@RequestMapping("personnel")
public class PersonnelController {
	
	private final PersonnelService ps;
	
	@Autowired
	public PersonnelController(PersonnelService ps) {
		this.ps = ps;
	}
	
	//인사관리 페이지 조회
	@GetMapping("main")
	public String person(Model model) {
		
		//디비 다녀오기
		List<MemberVo> memList = ps.selectMemberList();
		List<AccountVo> accList = ps.selectAccountList();
		
		//model에 데이터 담기
		model.addAttribute("memList", memList);
		model.addAttribute("accList", accList);
		
		//화면 선택
		return "personnel/main";
	}
	
	
}
