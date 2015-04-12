package com.soni.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="daily_transactions")
@Getter @Setter
public class DailyTransaction {
	@Getter
	public static enum DailyTransactionType{
		Debit("Debit"), Credit("Credit");
		
		private String code;
		private String label;
		private DailyTransactionType(String label){
			this.label = label;
			this.code = name();
		}
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="TRANSACTION_ID")
	private Integer transactionId;	

	@Column(name="AMOUNT")
	private BigDecimal amount;
	
	@Temporal(TemporalType.DATE)
	@Column(name="TRANSACTION_DATE")
	private Date transactionDate;
	
	@Column(name="TRANSACTION_TYPE")
	@Enumerated(EnumType.STRING)
	private DailyTransactionType transactionType;
	
	@Column(name="DESCRIPTION")
	private String description;
}
