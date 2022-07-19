package kg.groupc.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	@GetMapping("/login")
	public String login() {
		return "/login/loginForm";
	}
	@PostMapping("/login")
	public String loginError(Model model, HttpServletRequest request) {
		String errorMsg = request.getAttribute("errorMsg").toString();
		System.out.println("login post access");
		model.addAttribute("errorMsg", errorMsg);
		return "/login/loginForm";
	}
}
