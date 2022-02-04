package org.gocamping.service;

import java.util.List;

import org.gocamping.domain.campVO;
import org.gocamping.domain.criteria;
import org.gocamping.mapper.campMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class campServiceImpl implements campService{

	
	@Setter(onMethod_ = @Autowired)
	private campMapper mapper;
	
	@Override
	public List<campVO> getList() {
		// TODO Auto-generated method stub
		log.info("camp getList()...");
		return mapper.getList();
	}

	@Override
	public List<campVO> getList(criteria cri) {
		// TODO Auto-generated method stub
		log.info("camp getList()...");
		
		//검색 값이 있으면
		if(cri.getKeyword() != null || cri.getRegion() != null || cri.getTheme() != null) {
			return mapper.getListWithSearching(cri);
		}
		
		//검색값이 없으면 전체 검색
		return mapper.getList();
	}

	@Override
	public campVO get(Long cno) {
		// TODO Auto-generated method stub
		return mapper.get(cno);
	}

	

}
