package org.gocamping.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class LoginFailureHandler implements AuthenticationFailureHandler{

	private String username;
    private String password;
    private String errormsg;
    private String defaultFailureUrl;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.warn("Login Fail");
		log.warn(exception.getMessage());
		
		request.setAttribute(username, request.getParameter(username));
		request.setAttribute(password, request.getParameter(password));
		request.setAttribute(errormsg, exception.getMessage());
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);

	}

}
