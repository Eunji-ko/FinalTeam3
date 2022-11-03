package com.kh.checkmine.mail.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.mail.service.MailDetailService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailDetailController {
	
	private final MailDetailService service;
	private final MailService mailService;
	
	@Autowired
	public MailDetailController(MailDetailService service, MailService mailService) {
		this.mailService = mailService;
		this.service = service;
	}
	
	/**
	 * 받은메일 상세조회 화면
	 * @param mailNo
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("mail/receive/detail")
	public String mailReceiveDetail(@RequestParam(value = "n") String mailNo, Model model, HttpSession session) {	
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
		//리스트 객체 가져오기
		ReceiveMailVo mailVo = service.getReceiveMailVo(mailNo);
		
		System.out.println(mailVo);
		model.addAttribute("mailVo", mailVo);
		return "mail/mail_detail_receive";
	}
	
	/**
	 * 받은메일 상세조회에서 삭제
	 * @param receiveMailNo
	 * @return
	 */
	@PostMapping("mail/receive/detail/delete")
	@ResponseBody
	public String mailReceiveDetailDelete(String receiveMailNo) {
		String[] targetMails = {receiveMailNo};
		int result = mailService.moveRecycleBinReceive(targetMails);
		
		return Integer.toString(result);
	}
	
	/**
	 * 보낸메일 상세조회에서 삭제
	 * @param receiveMailNo
	 * @return
	 */
	@PostMapping("mail/send/detail/delete")
	@ResponseBody
	public String mailSendDetailDelete(String sandMailNo) {
		String[] targetMails = {sandMailNo};
		int result = mailService.moveRecycleBinSend(targetMails);
		
		return Integer.toString(result);
	}
	
	/**
	 * 받은메일 상세조회에서 중요도 표시
	 * @param receiveMailNo
	 * @param impVal
	 * @return
	 */
	@PostMapping("/mail/receive/detail/setImp")
	@ResponseBody
	public String mailReceiveDetailSetImp(String receiveMailNo, String impVal) {
		HashMap<String, String> impVo = new HashMap<String, String>();
		impVo.put("mailNum", receiveMailNo);
		impVo.put("importance", impVal);
		
		int result = mailService.setImportance(impVo);
		
		return Integer.toString(result);
	}
	
	/**
	 * 주어진 메일로 답장하기
	 * @param target
	 * @param model
	 * @return
	 */
	@GetMapping("mail/reply")
	public String mailReply(@RequestParam(value = "t") String target, Model model) {
		
		model.addAttribute("target", target);
		return "mail/mail_write_reply";
		
	}
	
	/**
	 * 참조메일 상세조회
	 * @param model
	 * @param session
	 * @param mailNo
	 * @return
	 */
	@GetMapping("/mail/ref/detail")
	public String mailRefDetail(Model model, HttpSession session,@RequestParam(value = "n") String mailNo) {
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
		//리스트 객체 가져오기
		ReceiveMailVo mailVo = service.getReceiveMailVo(mailNo);
		
		System.out.println(mailVo);
		model.addAttribute("mailVo", mailVo);
		
		return "mail/mail_detail_ref";
	}
	
	/**
	 * 보낸메일 상세조회
	 * @param model
	 * @param session
	 * @param mailNo
	 * @return
	 */
	@GetMapping("/mail/send/detail")
	public String mailSendDetail(Model model, HttpSession session,@RequestParam(value = "n") String mailNo) {
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
        MailVo mailVo = service.getSendMailVo(mailNo);
        
        System.out.println(mailVo);
		model.addAttribute("mailVo", mailVo);
        
		return "mail/mail_detail_send";
	}
	
	/**
	 * 중요메일 상세조회 화면
	 * @param mailNo
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("mail/imp/detail")
	public String mailImpDetail(@RequestParam(value = "n") String mailNo, Model model, HttpSession session) {	
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
		//리스트 객체 가져오기
		ReceiveMailVo mailVo = service.getReceiveMailVo(mailNo);
		
		System.out.println(mailVo);
		model.addAttribute("mailVo", mailVo);
		return "mail/mail_detail_imp";
	}
	
	/**
	 * 임시저장 상세조회
	 * @param mailNo
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("mail/save/detail")
	public String mailSaveDetail(@RequestParam(value = "n") String mailNo, Model model, HttpSession session) {
		//안읽은 메일 갯수 가져오기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
        
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
		
        MailSendFormVo mailSendFormVo = service.getSaveMailVo(mailNo);
        
        System.out.println(mailSendFormVo);
        model.addAttribute("mailVo", mailSendFormVo);
		return "mail/mail_write_save";
	}
	
	/**
	 * 파일 다운로드
	 * @param name
	 * @param origin
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@GetMapping("download/{name}/{origin}")
    public ResponseEntity<ByteArrayResource> download(@PathVariable String name,@PathVariable String origin, HttpServletRequest req) throws IOException {
        String fileName = URLEncoder.encode(origin, "UTF-8");
        fileName = "'" + fileName + "'";

        String path = req.getServletContext().getRealPath("/resources/upload/mail/");

        File file = new File(path + name);

        Path filePath = Paths.get(path+name);

        byte[] data = FileUtils.readFileToByteArray(file);
        ByteArrayResource res = new ByteArrayResource(data);

        return ResponseEntity
                .ok()
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .contentLength(Files.size(filePath))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + URLEncoder.encode(origin, "UTF-8"))
                .header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
                .body(res);
    }
	
	
	
}
