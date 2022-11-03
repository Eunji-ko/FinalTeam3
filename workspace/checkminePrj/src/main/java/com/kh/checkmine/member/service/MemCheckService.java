package com.kh.checkmine.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MemCheckService {
	
	private JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	private int authNumber; 
	// 난수 발생
	
	public void makeRandomNumber() {
		// 난수의 범위 100000 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(899999) + 100000;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	
			//이메일 보낼 양식! 
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		System.out.println(email);
		String toMail = email;
		String title = "체크마인 사원 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"체크마인을 이용해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}