package com.kh.checkmine.member.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.alarm.service.AlarmService;
import com.kh.checkmine.approval.service.ApprovalService;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.commute.service.CommuteService;
import com.kh.checkmine.commute.vo.CommuteVo;
import com.kh.checkmine.member.service.MemberService;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private final MemberService ms;
	private final ApprovalService as;
	private final CommuteService cs;
	private final AlarmService alarmService;
	
	@Autowired
	public MemberController(MemberService ms, ApprovalService as, CommuteService cs, AlarmService alarmService) {
		this.ms = ms;
		this.as = as;
		this.cs = cs;
		this.alarmService = alarmService;
	}
	
	@GetMapping("main")
	public String mainHome(HttpSession session, Model model) {
		
		//로그인 정보 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			//결재 목록 메인 화면에 보여주기
			int approvalCnt = as.selectTotalCnt(loginMember.getNo());
			PageVo pv = Pagination.getPageVo(7, 1, 1, 7);
			List<ApprovalDocVo> approvalList = as.selectList(loginMember.getNo(), pv);
			model.addAttribute("approvalList", approvalList);
			model.addAttribute("approvalCnt", approvalCnt);
			
			//출퇴근 시간 메인 화면에 보여주기
			int mycommuteTotalCount = cs.selectMycommuteTotalCnt(loginMember.getNo());
			List<CommuteVo> list = cs.selectListOne(loginMember.getNo(), Pagination.getPageVo(mycommuteTotalCount, 1, 1, mycommuteTotalCount));
			if(list != null) {
				if(list.size() != 0) {
					CommuteVo cvo = list.get(0);
					model.addAttribute("cvo", cvo);
				}
			}
			
		}
		
		return "member/main";
	}
	
	@GetMapping("findIdPwd")
	public String findIdPwd() {
		return "member/findIdPwd";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session, Model model) {
		
		MemberVo loginMember = ms.login(vo);
		
		if(loginMember != null) {
			//로그인 성공
			session.setAttribute("loginPwd", vo.getPwd());
			session.setAttribute("loginMember", loginMember);
			
			//결재 목록 메인 화면에 보여주기
			int approvalCnt = as.selectTotalCnt(loginMember.getNo());
			PageVo pv = Pagination.getPageVo(7, 1, 1, 7);
			List<ApprovalDocVo> approvalList = as.selectList(loginMember.getNo(), pv);
			model.addAttribute("approvalList", approvalList);
			model.addAttribute("approvalCnt", approvalCnt);
			
			//알람 넣기
			alarmService.insertTotalAlarm(loginMember.getNo());
			
			return "member/main";
		}else {
			//로그인 실패
			session.setAttribute("alertMsg", "로그인 실패 !");
			return "redirect:/";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("mypage")
	public String myPage() {
		return "member/mypage";
	}
	
	@PostMapping("changePwd")
	public String changePwd(MemberVo vo, String newPwd, HttpSession session) {
		
		vo.setPwd(newPwd);
		
		int result = ms.changePwd(vo);
		
		if(result == 1) {
			session.invalidate();
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다 !");
			return "redirect:/member/mypage";
		}
		
	}
	
	@PostMapping("changeInfo")
	public String changeInfo(MemberVo vo, HttpSession session) {
		
		int result = ms.changeInfo(vo);
		
		if(result == 1) {
			MemberVo loginMember = ms.selectOneByNo(vo.getNo());
			if(loginMember != null) {
				session.setAttribute("loginMember", loginMember);
				session.setAttribute("alertMsg", "개인정보를 성공적으로 변경하였습니다 !");
				return "redirect:/member/mypage";
			}else {
				session.setAttribute("alertMsg", "개인정보를 다시 불러오는 데에 실패하였습니다 !");
				return "redirect:/member/mypage";
			}
		}else {
			session.setAttribute("alertMsg", "개인정보 변경에 실패하였습니다 !");
			return "redirect:/member/mypage";
		}
		
	}
	
	@PostMapping("changePhoto")
	public String changePhoto(MemberVo vo, HttpServletRequest req, HttpSession session, Model model) {
		
		//파일 처리
		
		//기존파일 삭제
		String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
		MemberVo loginMember = (MemberVo)(session.getAttribute("loginMember"));
		String fileName = loginMember.getPhotoName();
		File f = new File(savePath + fileName);
		if(f.exists()) {
			f.delete();
		}
		
		//신규로 받은 파일 업로드, 저장된 파일명 얻기
		if(!vo.getProfile().isEmpty()) {
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setPhotoName(changeName);
		}
		
		vo.setNo(loginMember.getNo());
		
		MemberVo updatedMember = ms.changePhoto(vo);
		
		if(updatedMember != null) {
			//정보수정 성공
			session.setAttribute("loginMember", updatedMember);
			return "member/mypage";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", updatedMember);
			return "redirect:/member/mypage";
		}
	}

}
