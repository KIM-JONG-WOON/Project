package org.gocamping.domain;

import lombok.Data;

@Data
public class attachFileDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
