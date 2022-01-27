package org.gocamping.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class replyPageDTO {
	
	private int replyCnt;
	private List<replyVO> list;

}
