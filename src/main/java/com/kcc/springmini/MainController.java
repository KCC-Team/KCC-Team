package com.kcc.springmini;

import com.kcc.springmini.domain.meetup.model.dto.Criteria;
import com.kcc.springmini.domain.meetup.model.dto.PageDto;
import com.kcc.springmini.domain.meetup.model.vo.MeetUpVO;
import com.kcc.springmini.domain.meetup.service.MeetUpService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final MeetUpService meetUpService;

	@GetMapping("/")
	public String main(Criteria cri, Model model) {
		int total = meetUpService.getTotalCount(null, cri);

		model.addAttribute("list", meetUpService.findAll(cri));
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "/main";
	}

	@GetMapping("/search")
	public String meetUp(@RequestParam("title") String title, Criteria cri, Model model) {
		int total = meetUpService.getTotalCount(title, cri);
		model.addAttribute("list", meetUpService.findByTitle(title, cri));
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "/main";
	}

}
