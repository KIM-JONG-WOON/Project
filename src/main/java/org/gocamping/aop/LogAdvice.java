package org.gocamping.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {
	// SampleServiceImpl클래스의 모든 메서드가 실행되기 전에 동작
	@Before("execution(* org.gocamping.service.SampleService*.*(..))")
	public void logBefore() {
		//로그인 여부체크
		//시간을 logging
		
		log.info("=========================");
	}

}
