package org.gocamping.service;

import java.util.List;

import org.gocamping.domain.campVO;
import org.gocamping.domain.criteria;

public interface campService {
	public List<campVO> getList();
	public List<campVO> getList(criteria cri);
	public campVO get(Long cno);
}
