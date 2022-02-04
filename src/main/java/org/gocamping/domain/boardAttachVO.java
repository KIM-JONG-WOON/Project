package org.gocamping.domain;

import lombok.Data;

@Data
public class boardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;

}
