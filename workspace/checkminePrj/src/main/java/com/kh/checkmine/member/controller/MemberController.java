package com.kh.checkmine.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.member.service.MemberService;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private final MemberService ms;
	
	@Autowired
	public MemberController(MemberService ms) {
		this.ms = ms;
	}
	
	@GetMapping("main")
	public String mainHome() {
		return "member/main";
	}
	
	@GetMapping("findIdPwd")
	public String findIdPwd() {
		return "member/findIdPwd";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		
		MemberVo loginMember = ms.login(vo);
		
		if(loginMember != null) {
			//로그인 성공
			session.setAttribute("loginPwd", vo.getPwd());
			session.setAttribute("loginMember", loginMember);
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
		
		MemberVo updatedMember = ms.edit(vo);
		
		if(updatedMember != null) {
			//정보수정 성공
			session.setAttribute("loginMember", updatedMember);
			return "redirect:/";
		}else {
			//정보수정 실패
			session.setAttribute("alertMsg", updatedMember);
			return "redirect:/mypage";
		}
	}

}
