package org.gocamping.controller;


import java.util.Locale;

import org.gocamping.domain.criteria;
import org.gocamping.domain.memberVO;
import org.gocamping.domain.resVO;
import org.gocamping.service.campService;
import org.gocamping.service.memberService;
import org.gocamping.service.resService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@AllArgsConstructor
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	private memberService mService;
	
	private campService cService;
	
	private resService rService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
		
	
	}
	
	@GetMapping("/member/login")
	public void loginInput(String error, String logout, Model model, String result) {
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		if(result != null) {
			model.addAttribute("result", result);
		}
		
//		log.info("error: " +error);
//		log.info("logout: "+ logout);
		log.info("result: "+ result);
		
	}
	@PostMapping("/member/login")
	public void loginError() {}
	
	
	
	@GetMapping("/member/logined")
	@PreAuthorize("isAuthenticated()")
	public void logined() {
		
	};
	
	@GetMapping("/member/testUser")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	public void testUser() {};
	
	@GetMapping("/member/testAdmin")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	public void testAdmin() {};
	
	
	@GetMapping("/member/logout")
	@PreAuthorize("isAuthenticated()")
	public void logoutGET() {
		log.info("logout");
	};
	
	@GetMapping("/member/accessError")
	public void accessError(Authentication auth, Model model) {};
	
	@GetMapping("/member/memberRegister")
	public void memberRegister() {};
	
	@PostMapping("/member/memberRegister")
	public String register(memberVO member, RedirectAttributes rttr) {
		String result;
		if(mService.register(member)) {
			result="success";
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		result="fail";
		rttr.addAttribute("result", result);
		return "redirect:/member/memberRegister";
	};
	
	@GetMapping("/member/registerSuccess")
	public void registerSuccess() {};
	
	
	@GetMapping("/member/forgotPassword")
	public void forgotPassword() {};
	
	@GetMapping("/camp/search")
	public void search(criteria cri, Model model) {
		model.addAttribute("list", cService.getList(cri));
	};
	
	@GetMapping("/camp/main")
	public void main() {};
	
	
	@GetMapping("/camp/res")
	@PreAuthorize("isAuthenticated()")
	public void res(@RequestParam("cno") Long cno, Model model) {
		model.addAttribute("camp", cService.get(cno));
		
	};
	
	@PostMapping("/camp/res")
	@PreAuthorize("isAuthenticated()")
	public String res(resVO res, RedirectAttributes rttr) {
		log.info("등록전");
		rService.register(res);
		log.info("등록후");
		rttr.addFlashAttribute("result",res.getCno());
		return "redirect:/camp/search";
	};
	
	
	@GetMapping("/camp/contact")
	@PreAuthorize("isAuthenticated()")
	public void contact() {};
	
	@GetMapping("/camp/recommend")
	public void recommend() {};
	
	@GetMapping("/camp/resCheck")
	public void resCheck() {};

}
