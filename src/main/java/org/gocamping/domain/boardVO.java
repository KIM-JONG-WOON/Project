package org.gocamping.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class boardVO {
	private Long bno;
	private String title;
	private String content;
	private String email;
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;

	private List<boardAttachVO> attachList;
	
}
