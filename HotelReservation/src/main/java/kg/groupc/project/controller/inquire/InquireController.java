package kg.groupc.project.controller.inquire;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kg.groupc.project.controller.BaseController;
import kg.groupc.project.dto.inquire.InquireWriteForm;
import kg.groupc.project.entity.account.Account;
import kg.groupc.project.entity.inquire.Inquire;
import kg.groupc.project.repository.inquire.InquireRepository;
import kg.groupc.project.service.inquire.InquireService;


@Controller
public class InquireController extends BaseController{
	@Autowired
	private InquireService<Inquire, Long> inquireService;
	
	@Autowired
	private InquireRepository<Inquire, Long> inquireRepository;
	
	// 문의글 목록
	@GetMapping(value="/inquire")
	public String inquireList(Model model, 
			@PageableDefault(size = 5, sort = "seq", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String cat,
			@RequestParam(required = false, defaultValue = "") String keyword) {
			
		Page<Inquire> list = inquireRepository.findAll(pageable);
		if(cat.equals("username")) {
			list = inquireService.search1(keyword, pageable);
		} else if(cat.equals("title")) {
			list = inquireService.search2(keyword, pageable);
		}
		
		int pageNumber = list.getPageable().getPageNumber();
		int totalPages = list.getTotalPages();
		int pageBlock = 10;
		int startBlockPage = ((pageNumber)/pageBlock) * pageBlock + 1;
		int endBlockPage = startBlockPage + pageBlock - 1;
		endBlockPage = totalPages < endBlockPage ? totalPages : endBlockPage;
		
		model.addAttribute("startBlockPage", startBlockPage);
		model.addAttribute("endBlockPage", endBlockPage);
		model.addAttribute("list", list);
				
		return "/inquire/inquire";
	}
	
	// 문의 상세 페이지
	@GetMapping("/inquire/read/{seq}")
	public String inquireDetail(@PathVariable Long seq, Model model) {
		Inquire inquire = inquireService.readInquire(seq);
		model.addAttribute("inquire", inquire);		
		return "/inquire/read";
	}
		
	// 문의글 작성 페이지
	@GetMapping(value="/inquire/write")
	public String inquireWritePage(Model model) {
		model.addAttribute("inquireWriteForm", new InquireWriteForm(null, null, null, null, null, null, null, null));
		return "/inquire/inquireWriteForm";
	}
	
	// 게시글 Processing
	@PostMapping(value="/inquire/write")
	public String inquireWrite(@Valid InquireWriteForm idto, BindingResult br, 
						@AuthenticationPrincipal User user,
						Long seq, Model model) {
		Account account = accountService.getAccountById(user.getUsername());
//		Hotel hotel = hotelService.getHotelBySeq(seq);
		if(br.hasErrors()) {
			// 입력 데이터 값 유지
			model.addAttribute("inquireWriteForm", inquireService);			
			return "/inquire/inquireWriteForm";
		}
		idto.setWriter(account);
		inquireService.saveInquire(idto);
		System.out.println("문의글 작성되었습니다.");
		return "redirect:/inquire";
	}
	
	// 문의 수정 페이지
	@GetMapping("/inquire/edit/{seq}")
	public String inquireEditPage(@PathVariable("seq") Long seq, Model model) {
		Inquire inquire = inquireService.readInquire(seq);
		model.addAttribute("inquire", inquire);
		return "/inquire/edit";
	}

	// 수정하기 Processing
	@PostMapping(value="/inquire/edit")
	public String inquireEdit(@RequestParam("seq") Long seq, InquireWriteForm inquireDto, 
			BindingResult result, Model model) {
		Inquire inquire = inquireService.readInquire(seq);
		if(result.hasErrors()) {
			return "inquire/edit";
		}
		model.addAttribute("inquire", inquire);
		inquireService.edit(seq, inquireDto);
		return "redirect:/inquire/read/" + inquire.getSeq();
	}
	
	// 문의글 삭제

	@GetMapping(value="/inquire/delete/{seq}")
	public String deleteInquire(@PathVariable Long seq) {
		inquireService.delete(seq);
		return "redirect:/inquire";

	}
	
	//문의 답변 등록
	@GetMapping(value="/inquire/reply/{seq}")
	public String inquireReply(@PathVariable("seq") Long seq, Model model) {
		Inquire inquire = inquireService.readInquire(seq);
		model.addAttribute("inquire", inquire);
		return "/inquire/reply";		
	}
	
}