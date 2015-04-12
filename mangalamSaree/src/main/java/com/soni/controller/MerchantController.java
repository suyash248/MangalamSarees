package com.soni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soni.model.Merchant;
import com.soni.service.MerchantService;

@Controller
@RequestMapping("/merchant")
public class MerchantController {
	
	public List<Merchant> merchants;
	
	@Autowired
	private MerchantService merchantService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/merchantsMain")
	public String addMerchantForm(Model model) {
		merchants = merchantService.getAllMerchants();
		model.addAttribute("merchants", merchants);
		return "merchantsMain";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/submitCreateEditMerchant")
	public String submitCreateEditMerchant(@ModelAttribute(value="merchant") Merchant merchant, Model model) {
		merchant = merchantService.createdEditMerchant(merchant);
		merchants = merchantService.getAllMerchants();
		model.addAttribute("merchants", merchants);
		merchant = null;
		return "merchantsGrid";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/editMerchantForm")
	public String editMerchantForm(@RequestParam(value="merchantId") int merchantId, Model model) {
		model.addAttribute("merchant", merchantService.getMerchantDetail(merchantId));
		return "createEditMerchantForm";
	}
		
	@RequestMapping(method = RequestMethod.POST, value = "/resetMerchantForm")
	public String resetMerchantForm() {
		return "createEditMerchantForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/deleteMerchant")
	public String deleteMerchant(@RequestParam(value="merchantId") int merchantId, Model model) {
		merchantService.deleteMerchant(merchantId);
		merchants = merchantService.getAllMerchants();
		model.addAttribute("merchants", merchants);
		return "merchantsGrid";
	}
	
}
