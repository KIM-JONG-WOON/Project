package org.gocamping.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class criteria {
	private String keyword;
	private String region;
	private String theme;
	
	private String type;
	private int pageNum;
	private int amount;
	
	
	public criteria() {
		this(1,10);
	}
	
	public criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
	
	
}
