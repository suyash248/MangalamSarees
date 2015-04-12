package com.soni.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.soni.dto.SearchTransactionsDto;
import com.soni.model.DailyTransaction;
import com.soni.model.Transaction;

public interface TransactionService {
	public Transaction createEditTransaction(Transaction txn);
	public Transaction getTransactionDetail(int transactionId);
	public List<Transaction> getLatestTransactions(int noOfTxns);
	public List<Transaction> searchTransactionsByCriteria(SearchTransactionsDto searchDto);
	public Map<String, BigDecimal> calculateTotal(List<Transaction> transactions);
	public Map<String, BigDecimal> getSummary(Integer merchantId, int previousNmonths);
	public void createDailyTransaction(DailyTransaction dailyTransaction);
	public List<DailyTransaction> getDailyTransactions(SearchTransactionsDto searchDto);
	public Map<String, BigDecimal> calculateDailyTotal(List<DailyTransaction> dailyTransactions);
	
	/**
	 *  Not being used.
	 */
	public void deleteTransaction(int transactionId);
}
