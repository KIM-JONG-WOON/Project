package org.gocamping.mapper;

import java.util.List;

import org.gocamping.domain.campVO;
import org.gocamping.domain.criteria;


public interface campMapper {
	//캠프목록
	public List<campVO> getList();
	public List<campVO> getListWithSearching(criteria cri);
	public campVO get(Long cno);
	
}
