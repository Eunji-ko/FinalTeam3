package com.kh.checkmine.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.alarm.service.AlarmService;
import com.kh.checkmine.approval.service.ApprovalService;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.board.vo.ReplyVo;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.commute.service.CommuteService;
import com.kh.checkmine.commute.vo.CommuteVo;
import com.kh.checkmine.mail.service.MailAddrService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailAddrVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.member.service.MemberService;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private final MemberService ms;
	private final ApprovalService as;
	private final CommuteService cs;
	private final MailService mls;
	private final AlarmService alarmService;
	private final MailAddrService mas;
	
	@Autowired
	public MemberController(MemberService ms, ApprovalService as, CommuteService cs, MailService mls, AlarmService alarmService, MailAddrService mas) {
		this.ms = ms;
		this.as = as;
		this.cs = cs;
		this.mls = mls;
		this.alarmService = alarmService;
		this.mas = mas;
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
			
			//메일 수 보여주기
			int mailCnt = ms.countMail(loginMember.getNo());
			model.addAttribute("mailCnt", mailCnt);
			
			//메일함 메인 화면에 보여주기
			List<MailVo> mailList = ms.selectMailList(loginMember.getNo());
			if(mailList != null) {
				model.addAttribute("mailList", mailList);
			}
			
			//업무 메인 화면에 보여주기
			List<TaskOrderVo> taskList = ms.selectTaskList(loginMember.getNo());
			if(taskList != null) {
				model.addAttribute("taskList", taskList);
			}
			
			//일정 메인 화면에 보여주기
			List<ScheduleVo> eventList = ms.selectEventList(loginMember.getNo());
			if(eventList != null) {
				model.addAttribute("eventList", eventList);
			}
			
			//공유물 수 보여주기
			int publicCnt = ms.getPublicCnt(loginMember.getNo());
			model.addAttribute("publicCnt", publicCnt);
		}
		
		return "member/main";
	}
	
	@GetMapping("findIdPwd")
	public String findIdPwd() {
		return "member/findIdPwd";
	}
	
	@GetMapping("findId")
	@ResponseBody
	public String findId(String email, Model model) {
		
		String idFind = ms.findIdByMail(email);
		
		if(idFind == null) {
			idFind = "x";
		}		
				
		return idFind;
	}
	
	@PostMapping("findPwd")
	@ResponseBody
	public String findPwd(MemberVo vo) {
		
		String mailFind = ms.findMailByVo(vo);
		
		if(mailFind == null) {
			mailFind = "x";
		}
		
		return mailFind;
	}
	
	@GetMapping("login")
	public String login(HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			return "redirect:/member/main";
		}else {
			return "home";
		}
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
			alarmService.insertNoticeAlarm(loginMember.getNo());
			
			return "redirect:/member/main";
		}
		else {
			//로그인 실패
			session.setAttribute("alertMsg", "로그인 실패 !");
			return "home";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("mypage")
	public String myPage(HttpSession session, Model model) {
		//로그인 정보 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		List<BoardVo> boardList = ms.selectBoardList(loginMember.getNo());
		
		if(boardList != null) {
			model.addAttribute("boardList", boardList);
		}
		
		List<ReplyVo> replyList = ms.selectReplyList(loginMember.getNo());
		
		if(replyList != null) {
			model.addAttribute("replyList", replyList);
		}
		
		//사내 주소록 리스트 가져오기
		ArrayList<MailAddrVo> AddrListInner = (ArrayList<MailAddrVo>) mas.getAddrListInner(loginMember.getNo());
		//사외 주소록 리스트 가져오기
		ArrayList<MailAddrVo> AddrListOuter = (ArrayList<MailAddrVo>) mas.getAddrListOuter(loginMember.getNo());
		//거래처 주소록 리스트 가져오기
		ArrayList<MailAddrVo> AddrListAcc = (ArrayList<MailAddrVo>) mas.getAddrListAcc(loginMember.getNo());
		
		
		//각각 리스트 모델에 담기
		model.addAttribute("AddrListInner", AddrListInner);
		model.addAttribute("AddrListOuter", AddrListOuter);
		model.addAttribute("AddrListAcc", AddrListAcc);
		
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
	
	@GetMapping("changePwdById")
	public String changePwdById(MemberVo vo, HttpSession session) {
		
		int result = ms.changePwdById(vo);
		
		if(result == 1) {
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다 !");
			return "redirect:/";
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
	
	@RequestMapping("/kakaoLogin")
	public String login(@RequestParam("code") String code, HttpSession session) {
	    String access_Token = ms.getAccessToken(code);
	    HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    System.out.println(userInfo.get("email"));
	    String email = (String)userInfo.get("email");
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if(userInfo.get("email") != null) {
	        String findId = ms.findIdByMail(email);
	        
	        if(findId != null) {
	        	session.setAttribute("findId", "아이디 : " + findId);
	        }else {
	        	session.setAttribute("findId", "해당 카카오 계정 이메일과 일치하는 이메일 정보를 가진 사원 계정이 없습니다 !");
	        }
	    } else {
	    	session.setAttribute("findId", "카카오 계정의 이메일 조회에 실패하였습니다 !");
	    }
	    
	    
	    return "redirect:/member/findIdPwd";
	    //https://antdev.tistory.com/34 참고했음
	}

	
	

}
