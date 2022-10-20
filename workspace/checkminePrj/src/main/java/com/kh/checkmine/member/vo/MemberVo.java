package com.kh.checkmine.member.vo;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.Data;

@Data
public class MemberVo {

	public String no;
	public String posNo;
	public String deptNo;
	public String id;
	public String pwd;
	public String name;
	public String email;
	public String phone;
	public String address;
	public String addressDetail;
	public String modifyDate;
	public String enrollDate;
	public String resignDate;
	public String resignYn;
	public String photoName;
	public String photoPath;
	public String permission;
	
	public void encodePwd(PasswordEncoder pwdEnc) {
		this.pwd = pwdEnc.encode(this.pwd);
	}
	
}
