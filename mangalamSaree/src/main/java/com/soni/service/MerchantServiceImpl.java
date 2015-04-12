package com.soni.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.soni.model.Merchant;

@Repository
@Transactional(propagation=Propagation.REQUIRED, timeout=300)
public class MerchantServiceImpl extends AbstractServiceImpl implements MerchantService {
	public Merchant createdEditMerchant(Merchant merchant) {
		getSession().saveOrUpdate(merchant);
		return merchant;
	}
	
	@SuppressWarnings("unchecked")
	public List<Merchant> getAllMerchants() {
		List<Merchant> allMerchants = new ArrayList<Merchant>();
		String sql = "from Merchant";
		Query query = getSession().createQuery(sql);
		allMerchants = query.list();
		return allMerchants;
	}

	public Merchant getMerchantDetail(int merchantId) {
		String sql = "from Merchant m where m.merchantId=:merchantId";
		Query query = getSession().createQuery(sql);
		query.setParameter("merchantId", merchantId);
		Merchant merchant = (Merchant) query.uniqueResult();
		return merchant;
	}
	
	public void deleteMerchant(int merchantId) {
		Merchant merchant = (Merchant) getSession().get(Merchant.class, merchantId);
		getSession().delete(merchant);
	}
}
