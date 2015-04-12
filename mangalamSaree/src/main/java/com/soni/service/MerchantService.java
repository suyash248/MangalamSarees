package com.soni.service;

import java.util.List;

import com.soni.model.Merchant;

public interface MerchantService {
	public Merchant createdEditMerchant(Merchant merchant);
	public List<Merchant> getAllMerchants();
	public Merchant getMerchantDetail(int merchantId);
	
	/**
	 *  Not being used.
	 */
	public void deleteMerchant(int merchantId);
}
