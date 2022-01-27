package org.gocamping.service;

import org.gocamping.domain.memberVO;

public interface memberService {
	//회원정보 등록
	public boolean register(memberVO member);
	//회원정보 보기
	public memberVO get(String email);
	//회원정보 수정
	public boolean modify(memberVO member);
	//회원정보 삭제
	public boolean remove(String email);
}
