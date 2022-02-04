package org.gocamping.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class memberVO {
	private String email;
	private boolean emailCheck;
	private String password;
	private String name;
	private String phoneNumber;
	private int gender;
	private Date createDate;
	
	private List<authVO> authList;
	
	
}
