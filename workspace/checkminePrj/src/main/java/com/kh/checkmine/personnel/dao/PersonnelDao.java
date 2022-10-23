package com.kh.checkmine.personnel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.personnel.vo.AccountVo;

public interface PersonnelDao {

	List<MemberVo> selectMemberList(SqlSessionTemplate sst);

	List<AccountVo> selectAccountList(SqlSessionTemplate sst);

}
