package com.kh.checkmine.mail.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.mail.service.MailSendService;
import com.kh.checkmine.mail.service.MailService;
import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
public class MailWriteController {
	
	private final MailService mailService;
	private final MailSendService mailSendService;
	
	@Autowired
	public MailWriteController(MailService mailService, MailSendService mailSendService) {
		this.mailService = mailService;
		this.mailSendService = mailSendService;
	}
	
	/**
	 * 메일 쓰기 화면 보여주기
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("mail/write")
	public String mailWrite(HttpSession session, Model model) {
		
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		 //안읽은 메일 갯수 가져오기
        int notReadCountReceive = mailService.getNotReadCount(memberNo, "A");
        int notReadCountRef = mailService.getNotReadCount(memberNo, "R");
		
        model.addAttribute("notReadCountReceive", notReadCountReceive);
        model.addAttribute("notReadCountRef", notReadCountRef);
        return "mail/mail_write";
	}
	
	/**
	 * 메일 보내기
	 * @param formVo
	 * @return
	 */
	@PostMapping("mail/send")
	public String mailWriteSend(MailSendFormVo formVo,HttpSession session, String[] fileNames, HttpServletRequest req) {
		System.out.println(Arrays.toString(fileNames));

		//파일이름 데이터 뭉치기
		String savePath = "/checkmine/resources/upload/mail";
		List<MailAttVo> mailAttVoList = new ArrayList<MailAttVo>();
		
		for(int i = 0;i<fileNames.length;i++) {
			String[] arr = fileNames[i].split(",");
			
			MailAttVo mailAttVo = new MailAttVo();
			mailAttVo.setRealName(arr[0]);
			mailAttVo.setName(arr[1]);
			mailAttVo.setPath(savePath);
			
			mailAttVoList.add(mailAttVo);
		}
		formVo.setMailAttVoList(mailAttVoList);

		// 데이터 뭉치기
		String memberNo = ((MemberVo) session.getAttribute("loginMember")).getNo();
		formVo.setEmpNo(memberNo);

		formVo.setReceiverArr(formVo.getReceiver().split(","));
		formVo.setReferArr(formVo.getRefer().split(","));
		
		int mailResult = mailSendService.insertMail(formVo);
		
		//TODO 파일첨부
		if(mailResult == 1) {
			return "redirect:/mail/receive";
		}else{
			return "redirect:/mail/receive";
		}
	}
	
	/**
	 * 파일 업로드
	 * @param files
	 * @return
	 */
	@PostMapping(value = "mail/write/fileUpload", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String mailWriteFileUpload(@RequestParam(value = "files", required = false) MultipartFile[] files, HttpServletRequest req) {
		Gson gson = new Gson();
		String savePath = req.getServletContext().getRealPath("/resources/upload/mail/");
		List<HashMap<String, String>> fileNameMapList = new ArrayList<HashMap<String,String>>();
		
		if(files != null) {	
			
			for(MultipartFile file : files) {
//				System.out.println(file.getOriginalFilename());
				String originName = file.getOriginalFilename();
				String SaveName = FileUploader.fileUpload(file, savePath);
				
				HashMap<String, String> fileNameMap = new HashMap<String, String>();
				fileNameMap.put("originName", originName);
				fileNameMap.put("SaveName", SaveName);
				
				fileNameMapList.add(fileNameMap);
			}
		}
		
		return gson.toJson(fileNameMapList);
	}
	
	/**
	 * 파일 삭제
	 * @param filenames
	 * @param req
	 * @return
	 */
	@PostMapping(value = "mail/write/fileDelete", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String mailWriteFileDelete(String filenames, HttpServletRequest req) {
		String savePath = req.getServletContext().getRealPath("/resources/upload/mail/");
		String[] filenameArr = filenames.split(",");
		
		File file = new File(savePath+"/"+filenameArr[1]);
		
		boolean result = file.delete();
		if(result) {			
			return "성공";
		}else {
			return "실패";
		}
		
	}
}
