package com.soni.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.soni.model.Constants;
import com.soni.model.User;
import com.soni.service.MerchantService;
import com.soni.service.TransactionService;
import com.soni.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private MerchantService merchantService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/home")
	public String home(Model model) {
		model.addAttribute("merchants", merchantService.getAllMerchants());
		model.addAttribute("totalMap", transactionService.getSummary(null,Constants.PREVIOUS_N_MONTHS_SUMMARY));
		model.addAttribute("PREVIOUS_N_MONTHS_SUMMARY", Constants.PREVIOUS_N_MONTHS_SUMMARY);
		return "home.def";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/login")
	public String login() {
		return "loginForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/submitLogin")
	public String submit() {
		return "home.def";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/accessDenied")
	public String accessDenied() {
		return "accessDenied";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/logoutSuccess")
	public String logoutSuccess() {
		return "loginForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/changePasswordForm")
	public String changePassword() {
		return "changePasswordForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/changePasswordSubmit")
	public @ResponseBody String changePasswordSubmit(@RequestParam String currentPassword, @RequestParam String newPassword) throws JsonProcessingException {
		boolean status = userService.changePassword(currentPassword, newPassword);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(status);
	}
	
}
