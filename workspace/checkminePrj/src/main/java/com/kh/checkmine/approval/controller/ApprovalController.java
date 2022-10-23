package com.kh.checkmine.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.checkmine.approval.service.ApprovalService;
import com.kh.checkmine.approval.vo.ApprovalBuyOrderVo;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalExpenditureVo;
import com.kh.checkmine.approval.vo.ApprovalFileVo;
import com.kh.checkmine.approval.vo.ApprovalLeaveVo;
import com.kh.checkmine.approval.vo.ApprovalMinutesVo;
import com.kh.checkmine.approval.vo.ApprovalProposalVo;
import com.kh.checkmine.approval.vo.ApprovalStateVo;
import com.kh.checkmine.approval.vo.ApprovalVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	private final ApprovalService service;
	
	@Autowired
	public ApprovalController(ApprovalService service) {
		super();
		this.service = service;
	}

	//결재 메인화면
	@GetMapping(value= {""})
	public String approval() {
		return "approval/approval-outline";
	}
	
	//결재 리스트 화면
	@GetMapping(value={"list/{pno}","list"})
	public String list(@PathVariable(required = false) String pno, Model model, HttpSession session) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String employeeNo = loginMember.getNo();
		
		//페이지번호 파싱
		if(pno == null) {
			pno = "1";
		}
		int pnoInt = Integer.parseInt(pno);
		
		int totalCount = service.selectTotalCnt(employeeNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pnoInt, 5, 15);
		
		//디비 데이터 조회
		List<ApprovalDocVo> voList = service.selectList(employeeNo, pv);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		return "approval/list";
	}
	
	//결재자 선택 화면
	@GetMapping("select")
	public String select() {
		return "approval/approver-select";
	}
	
	//결재 리스트에서 세부화면
	@GetMapping("{dno}")
	public String detail(@PathVariable String dno, Model model, HttpSession session) {
		
		//문서번호로 결재정보 조회해오기
		ApprovalVo apVo = service.selectApByDocNo(dno);
		
		//작성X 결재O
		if(apVo != null) {
			//문서번호로 결재문서 조회해오기
			ApprovalDocVo docVo = service.selectDocByNo(dno);
			MemberVo writerVo = service.selectEmpByNo(docVo.getWriterNo());
			
			switch(docVo.getType()) {
			case "D":
				ApprovalDraftVo draftVo = service.selectDraftByNo(dno);
				model.addAttribute("draftVo", draftVo);
				break;
			case "P":
				ApprovalProposalVo proposalVo = service.selectProposalByNo(dno);
				model.addAttribute("proposalVo", proposalVo);
				break;
			case "M":
				ApprovalMinutesVo minutesVo = service.selectMinutesByNo(dno); 
				model.addAttribute("minutesVo", minutesVo);
				break;
			case "E":
				ApprovalExpenditureVo expenditureVo = service.selectExpenditureByNo(dno);
				model.addAttribute("expenditureVo", expenditureVo);
				break;
			case "B":
				ApprovalBuyOrderVo buyOrderVo = service.selectBuyOrderByNo(dno);
				model.addAttribute("buyOrderVo", buyOrderVo);
				break;
			case "S":
				ApprovalStateVo stateVo = service.selectStateByNo(dno);
				model.addAttribute("stateVo", stateVo);
				break;
			case "L":
				ApprovalLeaveVo leaveVo = service.selectLeaveByNo(dno);
				model.addAttribute("leaveVo", leaveVo);
				break;
			}
			
			//작성자 이름 가져오기
			docVo.setWriterNo(writerVo.getName());
			
			model.addAttribute("docVo", docVo);
		}
		
		//결재자 이름 가져오기
		if(apVo.getFirstApprover() != null) {
			apVo.setFirstApprover(service.selectEmpByNo(apVo.getFirstApprover()).getName());			
		}
		if(apVo.getSecondApprover() != null) {
			apVo.setSecondApprover(service.selectEmpByNo(apVo.getSecondApprover()).getName());			
		}
		if(apVo.getThirdApprover() != null) {
			apVo.setThirdApprover(service.selectEmpByNo(apVo.getThirdApprover()).getName());
		}
		apVo.setFinalApprover(service.selectEmpByNo(apVo.getFinalApprover()).getName());
		
		model.addAttribute("apVo", apVo);
		return "approval/approval-outline";
	}
	
	//결재자 검색 ajax
	@PostMapping(value={"first", "second", "third", "final"})
	@ResponseBody
	public String firstAp(String approver, Model model) {
		
		//이름으로 사원 검색
		List<MemberVo> memberList = service.selectEmpByName(approver);
		
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		if(memberList != null) {
			for(int i=0; i<memberList.size(); i++) {
				obj.addProperty("approver" + i, memberList.get(i).getName());
				obj.addProperty("email" + i, memberList.get(i).getEmail());
			}
			model.addAttribute("memberList", memberList);
		}
		String allEmpCnt = Integer.toString(service.selectEmpByName("").size());
		obj.addProperty("allEmpCnt", allEmpCnt);
	
		return gson.toJson(obj);
	}
	
	//기안서 작성
	@PostMapping(value={"draft/{dno}", "draft"})
	public String draft(@PathVariable(required = false) String dno, ApprovalDocVo docVo, ApprovalDraftVo draftVo, ApprovalFileVo fileVo, HttpSession session) {
		
		//회원 정보 가져오기
		
		//문서번호 존재 여부 확인
		
		return "redirect:/approval";
	}

}
