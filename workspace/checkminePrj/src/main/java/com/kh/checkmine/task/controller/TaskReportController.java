package com.kh.checkmine.task.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.service.MemberService;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.service.TaskOrderService;
import com.kh.checkmine.task.service.TaskReportService;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;
import com.kh.checkmine.task.vo.TaskReportAttVo;
import com.kh.checkmine.task.vo.TaskReportFileVo;
import com.kh.checkmine.task.vo.TaskReportVo;

@Controller
@RequestMapping("task/report")
public class TaskReportController {
	
	private final TaskOrderService orderService;
	private final TaskReportService reportService;
	private final MemberService memberService;
	
	@Autowired
	public TaskReportController(TaskOrderService orderService, TaskReportService reportService, MemberService memberService) {
		this.orderService = orderService;
		this.reportService = reportService;
		this.memberService = memberService;
	}
	
	//보고서 목록
	@GetMapping("list/{pno}")
	public String reportList(Model model, @PathVariable int pno, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		System.out.println("목록" + loginMember);
		
		int totalCount = reportService.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		List<TaskReportVo> voList = reportService.selectList(pv);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		model.addAttribute("loginMember", loginMember);

		return "task/report-list";
	}
	
	//보고서 작성(화면)
	@GetMapping("write")
	public String reportWrite(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		System.out.println("작성 화면" + loginMember);
		String empNo = loginMember.getNo();
		
		List<TaskOrderVo> taskList = orderService.selectListForAtt(empNo);
		
		List<MemberVo> memberList = reportService.selectWriteAttList();
		List<String> nameList = new ArrayList<String>();
		for(int i = 0; i < memberList.size(); i++) {
			String name = memberList.get(i).getName();
			nameList.add(name);
		}
		
		model.addAttribute("nameList", nameList);
		model.addAttribute("taskList", taskList);
		return "task/report-write";
	}
	
	//보고서 작성
	@PostMapping("write")
	public String reportWrite(TaskReportVo reportVo, TaskReportAttVo reportAttVo, TaskReportFileVo reprotFileVo, HttpServletRequest req, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//지시서 입력
		String sender = loginMember.getNo();
		 
		String attNoA = reportAttVo.getAttNoA();
		String attNoR = reportAttVo.getAttNoR();
		
		reportVo.setSender(sender);
		

		int reportResult = 0;
		int attNoAResult = 0;
		int attNoRResult = 0;

		//파일 등록
		MultipartFile[] fArr = reprotFileVo.getFiles();
		List<TaskReportFileVo> fileVoList = new ArrayList<TaskReportFileVo>();
		
		//수신 참조 등록
		Gson gson = new Gson();
		List<Map> listAttNoA = gson.fromJson(attNoA, ArrayList.class);
		List<Map> listAttNoR = gson.fromJson(attNoR, ArrayList.class);
		List<TaskReportAttVo> attVoList = new ArrayList<TaskReportAttVo>();
		
		//att 추가 테스트 (안되면 삭제)
		if(listAttNoA != null) { //attA not null 일 때
			for(Map m : listAttNoA) {
				TaskReportAttVo attVo = new TaskReportAttVo();
				String value = (String)m.get("value");
				attVo.setEmpNo(value);
				attVo.setType("A");
				attVoList.add(attVo); 
			}
			
			if(listAttNoR != null){
				for(Map m : listAttNoR) {
					TaskReportAttVo attVo = new TaskReportAttVo();
					String value = (String)m.get("value");
					attVo.setEmpNo(value);
					attVo.setType("R");
					attVoList.add(attVo);
				}
			}
			
			System.out.println("attVoList ::: " + attVoList);
			
			if(!fArr[0].isEmpty() && fArr != null) {
				String savePath = req.getServletContext().getRealPath("/resources/upload/task/report/");
				
				for(int i = 0; i < fArr.length; i++) {
					TaskReportFileVo fileVo = new TaskReportFileVo();
					MultipartFile f = fArr[i];
					
					String changeName = FileUploader.fileUpload(f, savePath);
					fileVo.setName(changeName);
					fileVo.setPath(savePath);
					fileVoList.add(fileVo);
				}
				System.out.println("fileVoList ::: " + fileVoList);
				reportResult = reportService.write(reportVo, attVoList, fileVoList);
			}else {
				reportResult = reportService.write(reportVo, attVoList);
			}
		}
		
		
		if(reportResult == 1) {
			session.setAttribute("alertMsg", "보고서가 작성되었습니다.");
			return "redirect:/task/report/list/1";
		}else {
			//문제 발생 시 파일 제거
			if(!fileVoList.isEmpty()) {
				for(int i=0; i<fileVoList.size(); i++) {
					String savePath = fileVoList.get(i).getPath()+fileVoList.get(i).getName();
					new File(savePath).delete();
				}
			}
			session.setAttribute("alertMsg", "보고서가 작성되지 못했습니다.");
			return "redirect:/task/report/list/1";
		}
		
		
	}
	
	//보고서 상세보기
	@GetMapping("detail/{no}")
	public String reportDetail(@PathVariable(required = false) String no, Model model, HttpSession session) {
		TaskReportVo vo = reportService.selectOneByNo(no);
		TaskReportAttVo aVo = reportService.selectAttOne(no);
		TaskReportAttVo rVo = reportService.selectAttROne(no);
		List<TaskReportFileVo> fileVo = reportService.selectFileForReportNo(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("aVo", aVo);
		model.addAttribute("rVo", rVo);
		model.addAttribute("fileVo", fileVo);
		
		return "task/report-detail";
	}
	
	//보고서 첨부파일 다운로드
	public ResponseEntity<ByteArrayResource> download(@PathVariable String no, @PathVariable String fno, HttpServletRequest req) throws Exception{
		List<TaskReportFileVo> fileVo = reportService.selectFileForNo(fno);
		
		System.out.println(fileVo);
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/task/report/");
		String name = fileVo.get(0).getName();

		File target = new File(rootPath+name);
			
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
				.ok()
				.contentType(null)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + name)
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.body(res);
	}
	
	//보고서 수정
	@GetMapping("edit")
	public String reportEdit() {
		return "task/report-edit";
	}
	
	//보고서 삭제
	@GetMapping("delete")
	public String reportDelete() {
		return "redirect:/task/order/list";
	}

}
