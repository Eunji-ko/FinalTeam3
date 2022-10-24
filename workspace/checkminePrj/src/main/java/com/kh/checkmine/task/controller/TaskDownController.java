package com.kh.checkmine.task.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.task.vo.TaskOrderFileVo;

@Controller
@RequestMapping("task")
public class TaskDownController {
	
	@GetMapping("{no}/download")
	public ResponseEntity<ByteArrayResource> download(HttpServletRequest req, @PathVariable(required = false) String no) throws IOException {
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/task/order");
		
		List<TaskOrderFileVo> fileVo = order();
		
		File target = new File(rootPath + "");
		
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
				.ok()
				.contentType(null)
				//.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.body(res);
	
	}

}
