package com.soni.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.soni.model.DailyTransaction.DailyTransactionType;
import com.soni.model.Transaction.TransactionType;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SearchTransactionsDto {
	private String transactionNumber;
	private Integer merchantId;
	private Date startDate;
	private Date endDate;
	private BigDecimal minAmount;
	private BigDecimal maxAmount;
	private TransactionType transactionType;
	
	private String description;
	private Date transactionDate;
	private BigDecimal amount;
	private DailyTransactionType dailyTransactionType;
}
