package org.gocamping.service;

import java.util.List;

import org.gocamping.domain.boardAttachVO;
import org.gocamping.domain.boardVO;
import org.gocamping.domain.criteria;



public interface boardService {
	
	public void register(boardVO board);
	
	public boardVO get(Long bno);
	
	public boolean modify(boardVO board);
	
	public boolean remove(Long bno);
	
	public List<boardVO> getList(criteria cri);
	
	public int getTotal(criteria cri);

	public List<boardAttachVO> getAttachList(Long bno);
	
	public void removeAttach(Long bno);
}
