package com.kh.checkmine.task.service;

import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderService {

	//지시서 작성
	int write(TaskOrderVo vo);

}
