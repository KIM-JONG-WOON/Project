package org.gocamping.service;

import java.util.List;

import org.gocamping.domain.criteria;
import org.gocamping.domain.replyPageDTO;
import org.gocamping.domain.replyVO;
import org.gocamping.mapper.boardMapper;
import org.gocamping.mapper.replyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class replyServiceImpl implements replyService{
	@Setter(onMethod_ = @Autowired)
	private replyMapper mapper; //자동주입	
	@Setter(onMethod_ = @Autowired)
	private boardMapper boardMapper; //자동주입
	
	@Transactional
	@Override
	public int register(replyVO vo) {
		
		log.info("register...." + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo); 
	}

	@Override
	public replyVO get(Long rno) {
		
		log.info("get...." + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(replyVO vo) {
		
		log.info("modify...." + vo);
		
		 return mapper.update(vo);
	}

	@Override
	public List<replyVO> getList(criteria cri, Long bno) {
		
		log.info("게시판의 리플 리스트...." + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	
	@Override
	public int remove(Long rno) {
		replyVO vo=mapper.read(rno);
		log.info("remove...." + rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);//댓글삭제
	}

	@Override
	public replyPageDTO getListPage(criteria cri, Long bno) {
		return new replyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}

}
