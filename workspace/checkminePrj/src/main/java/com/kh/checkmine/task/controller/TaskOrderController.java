package com.kh.checkmine.task.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.NameList;

import com.google.gson.Gson;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.service.MemberService;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.task.service.TaskOrderService;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Controller
@RequestMapping("task/order")
public class TaskOrderController {
	
	private final TaskOrderService orderService;
	private final MemberService memberService;
	
	@Autowired
	public TaskOrderController(TaskOrderService orderService, MemberService memberService) {
		this.orderService = orderService;
		this.memberService = memberService;
	}
	
	//지시서 목록
	@GetMapping("list/{pno}")
	public String orderList(Model model, @PathVariable int pno, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		int totalCount = orderService.selectTotalCnt();

		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
		
		List<TaskOrderVo> voList = orderService.selectList(pv);

		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		model.addAttribute("loginMember", loginMember);
		
		return "task/order-list";
	}
		
	//지시서 조회
	@GetMapping(value = {"detail/{no}", "detail"})
	public String orderDetail(@PathVariable(required = false) String no, Model model, HttpSession session) throws Exception {
		
		TaskOrderVo vo = orderService.selectOneByNo(no);
		TaskOrderAttVo aVo = orderService.selectAttOne(no);
		TaskOrderAttVo rVo = orderService.selectAttROne(no);
		List<TaskOrderFileVo> fileVo = orderService.selectFileList(no);

		model.addAttribute("vo", vo);
		model.addAttribute("aVo", aVo);
		model.addAttribute("rVo", rVo);
		model.addAttribute("fileVo", fileVo);
		System.out.println(fileVo);
		return "task/order-detail";
	}
	
		
	
	//지시서 작성(화면)
	//TODO tagify 수정해야함
	/* 
	 * json 형태로 data 여러개 담아서 보여줄 수 있게
	 * 안되면
	 * no로 받아오는 걸 name으로 받아서 넘길 수 있게 
	 */
	@GetMapping("write")
	public String orderWrite(Model model) {
		
		List<MemberVo> memberList = orderService.selectWriteAttList();
		List<String> nameList = new ArrayList<String>();
		for(int i = 0; i < memberList.size(); i++) {
			String name = memberList.get(i).getName();
			nameList.add(name);
		}
		
		model.addAttribute("nameList", nameList);
		return "task/order-write";
	}
	
	//지시서 작성
	@PostMapping("write")
	public String orderWrite(TaskOrderVo orderVo, TaskOrderAttVo orderAttVo, TaskOrderFileVo orderFileVo, HttpServletRequest req, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//지시서 입력
		String orderer = loginMember.getNo();
		String deptNo = loginMember.getDeptNo();
				
		String attNoA = orderAttVo.getAttNoA();
		String attNoR = orderAttVo.getAttNoR();

		orderVo.setOrderer(orderer);
		orderVo.setDeptNo(deptNo);
		
		int orderResult = 0;
		int attNoAResult = 0;
		int attNoRResult = 0;

		//파일 등록
		MultipartFile[] fArr = orderFileVo.getFiles();
		List<TaskOrderFileVo> fileVoList = new ArrayList<TaskOrderFileVo>();
		
		//수신 참조 등록
		Gson gson = new Gson();
		List<Map> listAttNoA = gson.fromJson(attNoA, ArrayList.class);
		List<Map> listAttNoR = gson.fromJson(attNoR, ArrayList.class);
		List<TaskOrderAttVo> attVoList = new ArrayList<TaskOrderAttVo>();
		
		//att 추가 테스트 (안되면 삭제)
		if(listAttNoA != null) { //attA not null 일 때
			for(Map m : listAttNoA) {
				TaskOrderAttVo attVo = new TaskOrderAttVo();
				String value = (String)m.get("value");
				attVo.setEmpNo(value);
				attVo.setType("A");
				attVoList.add(attVo); 
			}
			
			if(listAttNoR != null){
				for(Map m : listAttNoR) {
					TaskOrderAttVo attVo = new TaskOrderAttVo();
					String value = (String)m.get("value");
					attVo.setEmpNo(value);
					attVo.setType("R");
					attVoList.add(attVo);
				}
			}
			
			if(!fArr[0].isEmpty() && fArr != null) {
				String savePath = req.getServletContext().getRealPath("/resources/upload/task/order/");
				
				for(int i = 0; i < fArr.length; i++) {
					TaskOrderFileVo fileVo = new TaskOrderFileVo();
					MultipartFile f = fArr[i];
					
					String changeName = FileUploader.fileUpload(f, savePath);
					fileVo.setName(changeName);
					fileVo.setPath(savePath);
					fileVoList.add(fileVo);
				}
				orderResult = orderService.write(orderVo, attVoList, fileVoList);
			}else {
				orderResult = orderService.write(orderVo, attVoList);
			}
		}
		
		
		if(orderResult == 1) {
			session.setAttribute("alertMsg", "지시서가 작성되었습니다.");
			return "redirect:/task/order/list/1";
		}else {
			//문제 발생 시 파일 제거
			if(!fileVoList.isEmpty()) {
				for(int i=0; i<fileVoList.size(); i++) {
					String savePath = fileVoList.get(i).getPath()+fileVoList.get(i).getName();
					new File(savePath).delete();
				}
			}
			session.setAttribute("alertMsg", "지시서가 작성되지 못했습니다.");
			return "redirect:/task/order/list/1";
		}
	}
	
	//지시서 첨부파일 다운로드
	@GetMapping("download/{no}/{fno}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable String no, @PathVariable String fno, HttpServletRequest req) throws Exception {

		List<TaskOrderFileVo> fileVo = orderService.selectFile(fno);
		
		System.out.println(fileVo);
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/task/order/");
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
	
	
}
