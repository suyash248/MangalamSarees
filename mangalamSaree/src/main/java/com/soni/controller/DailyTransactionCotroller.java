package com.soni.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soni.dto.SearchTransactionsDto;
import com.soni.model.Constants;
import com.soni.model.DailyTransaction;
import com.soni.model.Transaction;
import com.soni.model.DailyTransaction.DailyTransactionType;
import com.soni.service.TransactionService;

@Controller
@RequestMapping("/dailyTransaction")
public class DailyTransactionCotroller {
	
	@Autowired
	private TransactionService transactionService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/dailyTransactionsMain")
	public String dailyTransactionsMain(Model model) {
		model.addAttribute("dailyTransactionTypes", Arrays.asList(DailyTransactionType.values()));
		List<DailyTransaction> dailyTransactions = transactionService.getDailyTransactions(new SearchTransactionsDto());
		model.addAttribute("dailyTransactions", dailyTransactions);
		model.addAttribute("totalMap", transactionService.calculateDailyTotal(dailyTransactions));
		return "dailyTransactionsMain";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/submitDebitCredit")
	public String submitDebitCredit(@ModelAttribute(value="dailyTransaction") DailyTransaction dailyTransaction, Model model) {
		transactionService.createDailyTransaction(dailyTransaction);
		List<DailyTransaction> dailyTransactions = transactionService.getDailyTransactions(new SearchTransactionsDto());
		model.addAttribute("dailyTransactions", dailyTransactions);
		model.addAttribute("totalMap", transactionService.calculateDailyTotal(dailyTransactions));
		return "dailyTransactionsGrid";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/searchDailyTransactions")
	public String searchDailyTransactions(@ModelAttribute(value="searchDto") SearchTransactionsDto searchDto, Model model) {
		List<DailyTransaction> dailyTransactions = transactionService.getDailyTransactions(searchDto);
		model.addAttribute("dailyTransactions", dailyTransactions);
		model.addAttribute("totalMap", transactionService.calculateDailyTotal(dailyTransactions));
		return "dailyTransactionsGrid";
	}
}
