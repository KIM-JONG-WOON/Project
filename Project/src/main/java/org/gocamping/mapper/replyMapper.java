package org.gocamping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gocamping.domain.criteria;
import org.gocamping.domain.replyVO;

public interface replyMapper {

	public int insert(replyVO vo);
	
	public replyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(replyVO reply);
	
	public List<replyVO> getListWithPaging(
			@Param("cri") criteria cri,
			@Param("bno") Long bno);
	
	public int  getCountByBno (Long bno);
}
