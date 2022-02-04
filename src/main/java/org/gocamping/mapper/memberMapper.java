package org.gocamping.mapper;

import org.gocamping.domain.memberVO;


public interface memberMapper {
	//로그인시 security에서 정보조회
	public memberVO read(String username);
	
	//회원가입
	public int insert(memberVO member);
	
	//회원가입시 권한 생성
	public int insertAuth(memberVO member);
}
