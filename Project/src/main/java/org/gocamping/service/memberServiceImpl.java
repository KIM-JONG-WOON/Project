package org.gocamping.service;

import org.gocamping.domain.memberVO;
import org.gocamping.mapper.memberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class memberServiceImpl implements memberService {

	@Setter(onMethod_ = @Autowired)
	private memberMapper mapper;//자동주입

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public boolean register(memberVO member) {
		// TODO Auto-generated method stub
		log.info("register....."+member);
		member.setPassword(pwencoder.encode(member.getPassword()));
		
		boolean registerResult = mapper.insert(member) == 1;
		
		boolean authRegisterResult= mapper.insertAuth(member) == 1;
		
		
		if( registerResult == true && authRegisterResult == true) {
			return true;
		}
		
		return false;
				
	}

	@Override
	public memberVO get(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(memberVO member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String email) {
		// TODO Auto-generated method stub
		return false;
	}

}
