package com.yedam.uriban.code.mapper;

import java.util.List;

import com.yedam.uriban.code.service.CodeVO;

public interface CodeMapper {
	public List<CodeVO> getCodeList(String maCd);
	

}
