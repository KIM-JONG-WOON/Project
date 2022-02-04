package org.gocamping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class resVO {
	private Long rno;
	private Long cno;
	private String resDate;
	private String email;
	private String rname;
	private String phoneNumber;
	private Date regDate;
	
}
