 package org.gocamping.service;

import java.util.List;

import org.gocamping.domain.boardAttachVO;
import org.gocamping.domain.boardVO;
import org.gocamping.domain.criteria;
import org.gocamping.mapper.boardAttachMapper;
import org.gocamping.mapper.boardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class boardServiceImpl implements boardService {
	
	@Setter(onMethod_ = @Autowired)
	private boardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private boardAttachMapper attachMapper;
	
	@Override
	public void register(boardVO board) {
		
		log.info("register ..... " + board);
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public boardVO get(Long bno) {
		
		log.info("get......" + bno);
		
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(boardVO board) {
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && 
				board.getAttachList().size()>0) {
			board.getAttachList().forEach(attach -> {
				
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		log.info("modify............" + board);
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		attachMapper.deleteAll(bno);
		log.info("remove............" + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<boardVO> getList(criteria cri) {
		
		log.info("get List With criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<boardAttachVO> getAttachList(Long bno) {
	
		return attachMapper.findByBno(bno);
	}
	
	@Override
	public void removeAttach(Long bno) {

		log.info("remove all attach files");

		attachMapper.deleteAll(bno);
	}



}
