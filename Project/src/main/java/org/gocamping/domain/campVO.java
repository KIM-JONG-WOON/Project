package org.gocamping.domain;

import lombok.Data;

@Data
public class campVO {
	private Long cno;
	private String cname;
	private String phoneNumber;
	private String site;
	private String theme;
	private String facility;
	private int findCount;
	private int visitCount;
	private int price;
	private String lat;
	private String lng;
	
	
}
