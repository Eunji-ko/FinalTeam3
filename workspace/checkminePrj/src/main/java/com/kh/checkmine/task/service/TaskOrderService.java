package com.kh.checkmine.task.service;

import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderService {
	
	//���ü� �ۼ�
	int write(TaskOrderVo vo);

	//����,���� ���
	int addAttNoA(TaskOrderAttVo orderAttVo);
	int addAttNoR(TaskOrderAttVo orderAttVo);

}
