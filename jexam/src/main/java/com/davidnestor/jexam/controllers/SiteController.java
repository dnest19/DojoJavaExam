package com.davidnestor.jexam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.davidnestor.jexam.models.Idea;
import com.davidnestor.jexam.models.User;
import com.davidnestor.jexam.services.IdeaService;
import com.davidnestor.jexam.services.UserService;
import com.davidnestor.jexam.validators.UserValidator;

@Controller
public class SiteController {
	@Autowired
	private UserService uService;
	
	@Autowired
	private IdeaService iService;
	
	@Autowired
	private UserValidator validator;
	
	@GetMapping("/")
	public String baseRoute(Model viewModel, @ModelAttribute("user") User user) {
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User newUser = this.uService.registerUser(user);
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/ideas";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("loginEmail") String email, @RequestParam("loginPass") String password, RedirectAttributes redirectAttr, HttpSession session) {
		if(!this.uService.authenticateUser(email, password)) {
			redirectAttr.addFlashAttribute("loginError", "Invalid Email or Password");
			return "redirect:/";
		}
		User user = this.uService.getByEmail(email);
		session.setAttribute("user_id", user.getId());
		return "redirect:/ideas";
	}
	
	@GetMapping("/logout")
	private String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/ideas")
	private String dashboard(Model viewModel, HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		viewModel.addAttribute("user", this.uService.find(userId));
		viewModel.addAttribute("ideas", this.iService.getIdeas());
		return "ideas.jsp";
	}
	
	@GetMapping("/ideas/new")
	private String newIdea(@ModelAttribute("idea") Idea idea, Model viewModel, HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		viewModel.addAttribute("user", this.uService.find(userId));
		return "newidea.jsp";
	}
	
	@PostMapping("/ideas/create")
	public String addIdea(@Valid @ModelAttribute("idea") Idea idea, BindingResult result, HttpSession session, Model viewModel) {
		if(result.hasErrors()) {
			Long userId = (Long)session.getAttribute("user_id");
			viewModel.addAttribute("user", this.uService.find(userId));
			return "newidea.jsp";
		}
		this.iService.create(idea);
		return "redirect:/ideas";
	}
	
	@GetMapping("ideas/display/{id}")
	public String viewIdea(@PathVariable("id") Long id, Model viewmodel) {
		viewmodel.addAttribute("idea", this.iService.getById(id));
		return "displayidea.jsp";
	}
	
	@GetMapping("ideas/delete/{id}")
	public String deleteIdea(@PathVariable("id") Long id) {
		this.iService.delete(id);
		return "redirect:/ideas";
	}
	
	@GetMapping("ideas/edit/{id}")
	public String updateIdea(@PathVariable("id") Long id, @ModelAttribute("idea") Idea idea, Model viewmodel) {
		viewmodel.addAttribute("idea", this.iService.getById(id));
		return "editidea.jsp";
	}
	
	@PostMapping("ideas/update/{id}")
	public String editIdea(@Valid @ModelAttribute("idea") Idea idea, BindingResult result, Model viewmodel, @PathVariable("id") Long id) {
		if(result.hasErrors()) {
			viewmodel.addAttribute("idea", this.iService.getById(id));
			return "editidea.jsp";
		}
		else {
			this.iService.updateIdea(idea);
			return "redirect:/ideas";
		}
	}
}
