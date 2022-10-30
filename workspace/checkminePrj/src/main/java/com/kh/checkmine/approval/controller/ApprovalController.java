package com.kh.checkmine.approval.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

@Controller
@RequestMapping("approval")
@MultipartConfig
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
			
			//문서번호로 첨부파일 가져오기
			List<ApprovalFileVo> fileList = service.selectFilesByNo(dno);
			
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
				List<ApprovalExpenditureVo> expenditureVo = service.selectExpenditureByNo(dno);
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
			model.addAttribute("fileList", fileList);
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
	public String firstAp(String approver) {
		
		//이름으로 사원 검색
		List<MemberVo> memberList = service.selectEmpByName(approver);
		
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		if(memberList != null) {
			for(int i=0; i<memberList.size(); i++) {
				obj.addProperty("approver" + i, memberList.get(i).getName());
				obj.addProperty("email" + i, memberList.get(i).getEmail());
				obj.addProperty("num" + i, memberList.get(i).getNo());
			}
		}
		String allEmpCnt = Integer.toString(service.selectEmpByName("").size());
		obj.addProperty("allEmpCnt", allEmpCnt);
	
		return gson.toJson(obj);
	}
	
	//결재자 정보 업데이트 메소드
	private String updateApInfo(String dno, ApprovalVo apVo, HttpSession session) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		int reject = 0;
		int complete = 0;
		int approval = 0;
		
		//문서번호로 DB에서 가져온 결재정보
		ApprovalVo dbApVo = service.selectApByDocNo(dno);
		
		if(!apVo.getReturnReason().isBlank()) {
			//DB에서 들고온 결재정보에 반려사유 넣기
			dbApVo.setReturnReason(apVo.getReturnReason());
			//반려사유 업데이트, 최종 결재일 업데이트
			reject = service.updateApReturn(dbApVo);
		}else if(loginMember.getNo().equals(dbApVo.getFinalApprover())){//최종 결재자 비교
			//상태(대기 -> 승인), 최종 결재일 업데이트
			complete = service.updateApStatus(dbApVo);
		}else if(loginMember.getNo().equals(dbApVo.getFirstApprover())){//1차 결재자 비교
			//1차 결재일 업데이트
			approval = service.updateApDate1(dbApVo);
		}else if(loginMember.getNo().equals(dbApVo.getSecondApprover())){//2차 결재자 비교
			//2차 결재일 업데이트
			approval = service.updateApDate2(dbApVo);
		}else if(loginMember.getNo().equals(dbApVo.getThirdApprover())){//3차 결재자 비교
			//3차 결재일 업데이트
			approval = service.updateApDate3(dbApVo);
		}
		
		if(reject == 1) {
			return "성공적으로 반려되었습니다.";
		}else if(complete == 1) {
			return "최종 결재 되었습니다.";
		}else if(approval == 1) {
			return "성공적으로 결재되었습니다.";
		}else {
			return "처리에 실패하였습니다.";
		}
		
	}
	
	//파일 저장 메소드
	private int saveFile(MultipartFile[] file, ApprovalDocVo docVo, HttpServletRequest req) {
		
		int fileResult = 0;
		for(int i=0; i<file.length; i++) {
			ApprovalFileVo fileVo = new ApprovalFileVo();
			MultipartFile f = file[i];
			
			//저장경로
			String savePath = req.getServletContext().getRealPath("/resources/upload/approval/");
			//파일 업로드 및 파일명 받기
			String changeName = FileUploader.fileUpload(f, savePath);
			
			fileVo.setFileName(changeName);
			fileVo.setFpath(savePath);
			fileVo.setDocNo(docVo.getNo());
			fileResult = service.insertFile(fileVo);
			fileResult++;
		}
		
		return fileResult;
	}
	
	//기안서 작성 및 결재
	@PostMapping(value={"draft/{dno}", "draft"})
	public String draft(@PathVariable(required = false) String dno, @ModelAttribute ApprovalVo apVo, @ModelAttribute ApprovalDocVo docVo,@ModelAttribute ApprovalDraftVo draftVo,@ModelAttribute MultipartFile[] file, HttpSession session, HttpServletRequest req) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호 존재 여부 확인
		if(dno != null) {
			
			//결재자 정보 업데이트 메소드
			String alertUpdateMsg = updateApInfo(dno, apVo, session);
			
			session.setAttribute("alertMsg", alertUpdateMsg);
			
		}else {//문서번호 없음
			//작성자 번호 세팅
			docVo.setWriterNo(loginMember.getNo());
			//결재 타입 세팅(기안서)
			docVo.setType("D");
			
			//기안서 결재 및 해당 문서정보 가져오기
			ApprovalDocVo result = service.approvalDraft(docVo, apVo, draftVo);
			
			if(result == null) {
				session.setAttribute("alertMsg", "문서 처리에 실패하였습니다.");
				return "redirect:/approval";
			}else {
				//파일 유무 확인
				if(!file[0].isEmpty()) {
					
					int saveFile = saveFile(file, result, req);
					
					if(saveFile != file.length) {
						session.setAttribute("alertMsg", "파일 처리에 실패하였습니다.");
						return "redirect:/approval";
					}
				}
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			}
		}
		return "redirect:/approval";
	}
	
	//제안서 작성 및 결재
	@PostMapping(value= {"proposal/{dno}","proposal"})
	public String proposal(@PathVariable(required = false) String dno, @ModelAttribute ApprovalVo apVo, @ModelAttribute ApprovalDocVo docVo,@ModelAttribute ApprovalProposalVo proposalVo,@ModelAttribute MultipartFile[] file, HttpSession session, HttpServletRequest req) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호 존재 여부 확인
		if(dno != null) {
			
			//결재자 정보 업데이트 메소드
			String alertUpdateMsg = updateApInfo(dno, apVo, session);
			
			session.setAttribute("alertMsg", alertUpdateMsg);
			
		}else {//문서번호 없음
			//작성자 번호 세팅
			docVo.setWriterNo(loginMember.getNo());
			//결재 타입 세팅(제안서)
			docVo.setType("P");
			
			//제안서 결재 및 해당 문서정보 가져오기
			ApprovalDocVo result = service.approvalProposal(docVo, apVo, proposalVo);
			
			if(result == null) {
				session.setAttribute("alertMsg", "문서 처리에 실패하였습니다.");
				return "redirect:/approval";
			}else {
				//파일 유무 확인
				if(!file[0].isEmpty()) {
					
					int saveFile = saveFile(file, result, req);
					
					if(saveFile != file.length) {
						session.setAttribute("alertMsg", "파일 처리에 실패하였습니다.");
						return "redirect:/approval";
					}
				}
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			}
		}
		
		return "redirect:/approval";
	}
	
	//거래처 선택 ajax
	@PostMapping("account")
	@ResponseBody
	public String account(String corporate) {
		
		//이름으로 거래처 검색
		List<AccountVo> accountList = service.selectAccountByName(corporate);
		
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		if(accountList != null) {
			for(int i=0; i<accountList.size(); i++) {
				obj.addProperty("no" + i, accountList.get(i).getNo());
				obj.addProperty("corporate" + i, accountList.get(i).getCorporate());
				obj.addProperty("address" + i, accountList.get(i).getAddress());
				obj.addProperty("tel" + i, accountList.get(i).getTel());
				obj.addProperty("fax" + i, accountList.get(i).getFax());
				obj.addProperty("pname" + i, accountList.get(i).getPname());
				obj.addProperty("dept" + i, accountList.get(i).getDept());
				obj.addProperty("position" + i, accountList.get(i).getPosition());
				obj.addProperty("email" + i, accountList.get(i).getEmail());
				obj.addProperty("phone" + i, accountList.get(i).getPhone());
			}
		}
		String allAccCnt = Integer.toString(service.selectAccountByName("").size());
		obj.addProperty("allAccCnt", allAccCnt);
	
		return gson.toJson(obj);
	}
	
	//회의록 작성 및 결재
	@PostMapping(value={"minutes/{dno}","minutes"})
	public String minutes(@PathVariable(required = false) String dno, @ModelAttribute ApprovalVo apVo, @ModelAttribute ApprovalDocVo docVo,@ModelAttribute ApprovalMinutesVo minutesVo,@ModelAttribute MultipartFile[] file, HttpSession session, HttpServletRequest req) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호 존재 여부 확인
		if(dno != null) {
			
			//결재자 정보 업데이트 메소드
			String alertUpdateMsg = updateApInfo(dno, apVo, session);
			
			session.setAttribute("alertMsg", alertUpdateMsg);
			
		}else {//문서번호 없음
			//작성자 번호 세팅
			docVo.setWriterNo(loginMember.getNo());
			//결재 타입 세팅(회의록)
			docVo.setType("M");
			
			//회의록 결재 및 해당 문서정보 가져오기
			ApprovalDocVo result = service.approvalMinutes(docVo, apVo, minutesVo);
			
			if(result == null) {
				session.setAttribute("alertMsg", "문서 처리에 실패하였습니다.");
				return "redirect:/approval";
			}else {
				//파일 유무 확인
				if(!file[0].isEmpty()) {
					
					int saveFile = saveFile(file, result, req);
					
					if(saveFile != file.length) {
						session.setAttribute("alertMsg", "파일 처리에 실패하였습니다.");
						return "redirect:/approval";
					}
				}
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			}
		}
		
		return "redirect:/approval";
	}
	
	//지출결의서 작성 및 결재
	@PostMapping(value={"expenditure/{dno}", "expenditure"})
	public String expenditure(@PathVariable(required = false) String dno, @ModelAttribute ApprovalVo apVo, @ModelAttribute ApprovalDocVo docVo,@ModelAttribute ApprovalExpenditureVo expenditureVo,@ModelAttribute MultipartFile[] file, HttpSession session, HttpServletRequest req) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호 존재 여부 확인
		if(dno != null) {
			
			//결재자 정보 업데이트 메소드
			String alertUpdateMsg = updateApInfo(dno, apVo, session);
			
			session.setAttribute("alertMsg", alertUpdateMsg);
			
		}else {//문서번호 없음
			//작성자 번호 세팅
			docVo.setWriterNo(loginMember.getNo());
			//결재 타입 세팅(지출결의서)
			docVo.setType("E");
			
			//지출결의서 결재 및 해당 문서정보 가져오기
			//memo : expenditureVo(여러 값 들어옴)는 값을 쉼표를 기준으로 split 해줘야함
			ApprovalDocVo result = service.approvalExpenditure(docVo, apVo, expenditureVo);
			
			if(result == null) {
				session.setAttribute("alertMsg", "문서 처리에 실패하였습니다.");
				return "redirect:/approval";
			}else {
				//파일 유무 확인
				if(!file[0].isEmpty()) {
					
					int saveFile = saveFile(file, result, req);
					
					if(saveFile != file.length) {
						session.setAttribute("alertMsg", "파일 처리에 실패하였습니다.");
						return "redirect:/approval";
					}
				}
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			}
		}
		return "redirect:/approval";
	}
	
	//구매품의서 작성 및 결재
	@PostMapping(value={"order/{dno}", "order"})
	public String buyOrder(@PathVariable(required = false) String dno, @ModelAttribute ApprovalVo apVo, @ModelAttribute ApprovalDocVo docVo,@ModelAttribute ApprovalBuyOrderVo buyOrderVo,@ModelAttribute MultipartFile[] file, HttpSession session, HttpServletRequest req) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호 존재 여부 확인
		if(dno != null) {
			
			//결재자 정보 업데이트 메소드
			String alertUpdateMsg = updateApInfo(dno, apVo, session);
			
			session.setAttribute("alertMsg", alertUpdateMsg);
			
		}else {//문서번호 없음
			//작성자 번호 세팅
			docVo.setWriterNo(loginMember.getNo());
			//결재 타입 세팅(구매품의서)
			docVo.setType("B");
			
			//구매품의서 결재 및 해당 문서정보 가져오기
			ApprovalDocVo result = service.approvalBuyOrder(docVo, apVo, buyOrderVo);
			
			if(result == null) {
				session.setAttribute("alertMsg", "문서 처리에 실패하였습니다.");
				return "redirect:/approval";
			}else {
				//파일 유무 확인
				if(!file[0].isEmpty()) {
					
					int saveFile = saveFile(file, result, req);
					
					if(saveFile != file.length) {
						session.setAttribute("alertMsg", "파일 처리에 실패하였습니다.");
						return "redirect:/approval";
					}
				}
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			}
		}
		return "redirect:/approval";
	}
	
	//전표 작성 및 결재
	@PostMapping(value={"state/{dno}", "state"})
	public String state(@PathVariable(required = false) String dno, @ModelAttribute ApprovalVo apVo, @ModelAttribute ApprovalDocVo docVo,@ModelAttribute ApprovalStateVo stateVo,@ModelAttribute MultipartFile[] file, HttpSession session, HttpServletRequest req) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//문서번호 존재 여부 확인
		if(dno != null) {
			
			//결재자 정보 업데이트 메소드
			String alertUpdateMsg = updateApInfo(dno, apVo, session);
			
			session.setAttribute("alertMsg", alertUpdateMsg);
			
		}else {//문서번호 없음
			//작성자 번호 세팅
			docVo.setWriterNo(loginMember.getNo());
			//결재 타입 세팅(전표)
			docVo.setType("S");
			
			//전표 결재 및 해당 문서정보 가져오기
			ApprovalDocVo result = service.approvalState(docVo, apVo, stateVo);
			
			if(result == null) {
				session.setAttribute("alertMsg", "문서 처리에 실패하였습니다.");
				return "redirect:/approval";
			}else {
				//파일 유무 확인
				if(!file[0].isEmpty()) {
					
					int saveFile = saveFile(file, result, req);
					
					if(saveFile != file.length) {
						session.setAttribute("alertMsg", "파일 처리에 실패하였습니다.");
						return "redirect:/approval";
					}
				}
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			}
		}
		return "redirect:/approval";
	}

}//class
