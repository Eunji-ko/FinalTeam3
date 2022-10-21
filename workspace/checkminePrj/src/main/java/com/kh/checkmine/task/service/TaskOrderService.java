package com.kh.checkmine.task.service;

import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

public interface TaskOrderService {
	
	//���ü� �ۼ�
	int write(TaskOrderVo vo);

	//����,���� ���
	int insertAttNoA(TaskOrderAttVo orderAttVo);
	int insertAttNoR(TaskOrderAttVo orderAttVo);

	int insertFile(TaskOrderFileVo orderFileVo);


}
