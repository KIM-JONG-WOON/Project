package org.gocamping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gocamping.domain.boardVO;
import org.gocamping.domain.criteria;

public interface boardMapper {
	
	
	public List<boardVO> getList();
	
	public List<boardVO> getListWithPaging(criteria cri);
	
	public void insert(boardVO board);
	
	public Integer insertSelectKey(boardVO board);
	
	public boardVO read(Long bno);
	
	public int delete (Long bno);
	
	public int update (boardVO board);
	
	public int getTotalCount(criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

}
