package com.yedam.uriban.code.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.uriban.code.mapper.CodeMapper;
import com.yedam.uriban.code.service.CodeService;
import com.yedam.uriban.code.service.CodeVO;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeMapper codeMapper;
	
	@Override
	public List<CodeVO> getCodeList(String maCd) {
		List<CodeVO> codeList = codeMapper.getCodeList(maCd);
		return codeList;
	}
	
}
