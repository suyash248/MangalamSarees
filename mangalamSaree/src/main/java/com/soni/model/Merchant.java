package com.soni.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="merchants")
@Getter @Setter
public class Merchant {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="MERCHANT_ID")
	private Integer merchantId;

	@Column(name="MERCHANT_NAME")
	private String merchantName;
	
	@Column(name="PHONE")
	private String phone;
	
	@Column(name="ADDRESS")
	private String address;
	
	@OneToMany(mappedBy="merchant")
	private Set<Transaction> trancations;
	
}
