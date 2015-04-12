package com.soni.model;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="transactions")
@Getter @Setter
public class Transaction {

	@Getter
	public static enum TransactionType{
		Debit("Debit"), Credit("Credit"), GR("GR");
		
		private String code;
		private String label;
		private TransactionType(String label){
			this.label = label;
			this.code = name();
		}
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="TRANSACTION_ID")
	private Integer transactionId;	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="MERCHANT_ID")
	private Merchant merchant;

	@Column(name="AMOUNT")
	private BigDecimal amount;
	
	@Column(name="TRANSACTION_NUMBER")
	private String transactionNumber;	// Bill Number OR Slip Number
	
	@Temporal(TemporalType.DATE)
	@Column(name="TRANSACTION_DATE")
	private Date transactionDate;
	
	@Column(name="TRANSACTION_TYPE")
	@Enumerated(EnumType.STRING)
	private TransactionType transactionType;
	
}
