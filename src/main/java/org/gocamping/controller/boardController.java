package org.gocamping.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.gocamping.domain.boardAttachVO;
import org.gocamping.domain.boardVO;
import org.gocamping.domain.criteria;
import org.gocamping.domain.pageDTO;
import org.gocamping.service.boardService;
import org.gocamping.service.replyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class boardController {
	
private boardService service;
private replyService rService;
	@GetMapping({"/list","/list2"})
	public void list(criteria cri, Model model) {
		log.info("list" + cri);
		log.info(service.getList(cri));
		
		model.addAttribute("list",service.getList(cri));
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker",new pageDTO(cri,total));
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(boardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
		
		if(board.getAttachList() != null) {
			
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(board);
		rttr.addFlashAttribute("result",board.getBno());
		
		return "redirect:/board/list";
	}
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") criteria cri) {
		log.info("remove " + bno);
		
		List<boardAttachVO> attachList = service.getAttachList(bno);
		
		if (service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") criteria cri) {
		model.addAttribute("board",service.get(bno));
		
	}
	
	@PostMapping("/modify")
	public String modify(boardVO board, RedirectAttributes rttr, @ModelAttribute("cri") criteria cri) {
		log.info("modify: " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/board/list" + cri.getListLink();
	}
	@GetMapping(value="/getAttachList",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<boardAttachVO>> getAttachList(Long bno){
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<boardAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());

					Files.delete(thumbNail);
				}

			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}

}
