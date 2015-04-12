package com.soni.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soni.dto.SearchTransactionsDto;
import com.soni.model.Constants;
import com.soni.model.Transaction;
import com.soni.model.Transaction.TransactionType;
import com.soni.service.MerchantService;
import com.soni.service.TransactionService;

@Controller
@RequestMapping("/transaction")
public class TransactionController {
	
	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private MerchantService merchantService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/transactionsMain")
	public String debitCreditForm(Model model) {
		model.addAttribute("merchants", merchantService.getAllMerchants());
		model.addAttribute("transactionTypes", Arrays.asList(TransactionType.values()));
		model.addAttribute("transactions", transactionService.getLatestTransactions(Constants.MAX_LATEST_TRANSACTION_TO_DISPLAY));
		return "transactionsMain";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/editMerchantTransactionForm")
	public String editMerchantTransactionForm(@RequestParam(value="transactionId") int transactionId, Model model) {
		model.addAttribute("transaction", transactionService.getTransactionDetail(transactionId));
		model.addAttribute("merchants", merchantService.getAllMerchants());
		model.addAttribute("transactionTypes", Arrays.asList(TransactionType.values()));
		return "transactionsForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/resetMerchantTransactionForm")
	public String resetMerchantTransactionForm(Model model) {
		model.addAttribute("merchants", merchantService.getAllMerchants());
		model.addAttribute("transactionTypes", Arrays.asList(TransactionType.values()));
		return "transactionsForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/submitDebitCredit")
	public String submitDebitCredit(@ModelAttribute(value="transaction") Transaction transaction, Model model) {
		transaction = transactionService.createEditTransaction(transaction);
		List<Transaction> latestTransactions = transactionService.getLatestTransactions(Constants.MAX_LATEST_TRANSACTION_TO_DISPLAY);
		model.addAttribute("transactions", latestTransactions);
		transaction = null;
		return "transactionsGrid";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/transactionsSearchMain")
	public String transactionsSearchMain(Model model) {
		model.addAttribute("merchants", merchantService.getAllMerchants());
		model.addAttribute("transactionTypes", Arrays.asList(TransactionType.values()));
		return "searchTransactionsMain";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/submitSearchTransactions")
	public String submitSearchTransactions(@ModelAttribute(value="searchDto") SearchTransactionsDto searchDto, Model model) {		
		List<Transaction> transactions = transactionService.searchTransactionsByCriteria(searchDto);
		model.addAttribute("transactions", transactions);
		model.addAttribute("totalMap", transactionService.calculateTotal(transactions));
		return "searchTransactionsGrid";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/getSummaryByMerchant")
	public String getSummaryByMerchant(@RequestParam(value="merchantId") int merchantId, Model model) {		
		model.addAttribute("merchants", merchantService.getAllMerchants());
		model.addAttribute("totalMap", transactionService.getSummary(merchantId, Constants.PREVIOUS_N_MONTHS_SUMMARY));
		model.addAttribute("PREVIOUS_N_MONTHS_SUMMARY", Constants.PREVIOUS_N_MONTHS_SUMMARY);
		return "lastNmonthsSummary";
	}
	
	/**
	 * Not being used.
	 * @param transactionId
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/deleteTransaction")
	public String deleteTransaction(@RequestParam(value="transactionId") int transactionId,Model model) {
		transactionService.deleteTransaction(transactionId);
		model.addAttribute("transactions", transactionService.getLatestTransactions(Constants.MAX_LATEST_TRANSACTION_TO_DISPLAY));
		return "transactionsGrid";
	}
	
}
