package org.gocamping.mapper;

import java.util.List;

import org.gocamping.domain.boardAttachVO;



public interface boardAttachMapper {
	//첨부파일등록
	public void insert(boardAttachVO vo);	
	//첨부파일삭제
	public void delete(String uuid);	
	//첨부파일목록
	public List<boardAttachVO> findByBno(Long bno);
	//첨부파일모두삭제
	public void deleteAll(Long bno);
	//어제날짜첨부파일목록
	public List<boardAttachVO> getOldFiles();
}
