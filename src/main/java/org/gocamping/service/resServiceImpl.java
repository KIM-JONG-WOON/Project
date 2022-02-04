package org.gocamping.service;

import org.gocamping.domain.resVO;
import org.gocamping.mapper.resMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class resServiceImpl implements resService{
	
	@Setter(onMethod_ = @Autowired)
	private resMapper mapper;

	@Override
	public void register(resVO res) {
		// TODO Auto-generated method stub
		log.info("mapper.register(res)실행");
		mapper.register(res);
	}
	
	

}
