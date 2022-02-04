package org.gocamping.service;

import java.util.List;

import org.gocamping.domain.criteria;
import org.gocamping.domain.replyPageDTO;
import org.gocamping.domain.replyVO;


public interface replyService {
	
	public int register(replyVO vo);
	
	public replyVO get(Long bno);
	
	public int modify(replyVO vo);
	
	public int remove(Long rno);
	
	public List<replyVO> getList(criteria cri, Long bno);

	public replyPageDTO getListPage(criteria cri, Long bno);
}
