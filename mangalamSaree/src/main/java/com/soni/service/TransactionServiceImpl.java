package com.soni.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.soni.dto.SearchTransactionsDto;
import com.soni.model.DailyTransaction;
import com.soni.model.DailyTransaction.DailyTransactionType;
import com.soni.model.Transaction;
import com.soni.model.Transaction.TransactionType;

@Repository
@Transactional(propagation=Propagation.REQUIRED, timeout=300)
public class TransactionServiceImpl extends AbstractServiceImpl implements TransactionService {
	public Transaction createEditTransaction(Transaction txn) {
		getSession().saveOrUpdate(txn);
		return txn;
	}
	
	public Transaction getTransactionDetail(int transactionId) {
		String sql = "select txn from Transaction txn "
				+ " left join fetch txn.merchant m "
				+ " where txn.transactionId=:transactionId ";
		Query query = getSession().createQuery(sql);
		query.setParameter("transactionId", transactionId);
		Transaction txn = (Transaction) query.uniqueResult();
		return txn;
	}
	
	@SuppressWarnings("unchecked")
	public List<Transaction> getLatestTransactions(int noOfTxns) {
		List<Transaction> latestTransactions = new ArrayList<Transaction>();
		String sql = "from Transaction txn "
				+ " left join fetch txn.merchant mchant "
				+ " order by txn.transactionDate desc";
		Query query = getSession().createQuery(sql);
		query.setMaxResults(noOfTxns);
		latestTransactions = query.list();
		return latestTransactions;
	}
	
	@SuppressWarnings("unchecked")
	public List<Transaction> searchTransactionsByCriteria(SearchTransactionsDto searchDto) {
		List<Transaction> transactions = new ArrayList<Transaction>();
		String sql = "select txn from Transaction txn "
				+ " left join fetch txn.merchant m "
				+ " where (:merchantId is null or m.merchantId=:merchantId) "
				+ " and (:transactionNumber is null or txn.transactionNumber like :transactionNumber) "
				+ " and (:startDate is null or txn.transactionDate >= :startDate) "
				+ " and (:endDate is null or txn.transactionDate <= :endDate) "
				+ " and (:minAmount is null or txn.amount>=:minAmount) "
				+ " and (:maxAmount is null or txn.amount<=:maxAmount) "
				+ " and (:transactionType is null or txn.transactionType=:transactionType) "
				+ " order by txn.transactionDate desc ";
		Query query = getSession().createQuery(sql);
		query.setParameter("merchantId", searchDto.getMerchantId());
		query.setParameter("transactionNumber", StringUtils.isNotEmpty(searchDto.getTransactionNumber()) ? "%"+searchDto.getTransactionNumber()+"%" : null);
		query.setParameter("startDate", searchDto.getStartDate()==null ? null : new SimpleDateFormat("yyyy-MM-dd").format(searchDto.getStartDate()));  //DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		query.setParameter("endDate", searchDto.getEndDate()==null ? null : new SimpleDateFormat("yyyy-MM-dd").format(searchDto.getEndDate()));
		query.setParameter("minAmount", searchDto.getMinAmount());
		query.setParameter("maxAmount", searchDto.getMaxAmount());
		query.setParameter("transactionType", searchDto.getTransactionType()==null ? null :searchDto.getTransactionType().getCode());
		
		transactions = query.list();
		return transactions;
	}
	
	public Map<String, BigDecimal> calculateTotal(List<Transaction> transactions) {
		Map<String, BigDecimal> totalMap = new HashMap<String, BigDecimal>();
		BigDecimal totalDebit=BigDecimal.ZERO, totalCredit=BigDecimal.ZERO, totalGR=BigDecimal.ZERO, remaining=BigDecimal.ZERO;
		
		for(Transaction transaction : transactions) {
			if(transaction.getTransactionType()==TransactionType.Debit){
				totalDebit = transaction.getAmount().add(totalDebit);
			}
			if(transaction.getTransactionType()==TransactionType.Credit){
				totalCredit = transaction.getAmount().add(totalCredit);
			}
			if(transaction.getTransactionType()==TransactionType.GR){
				totalGR = transaction.getAmount().add(totalGR);
			}
		}
		remaining = totalDebit.subtract(totalCredit.add(totalGR));
		totalMap.put(TransactionType.Debit.getCode(), totalDebit);
		totalMap.put(TransactionType.Credit.getCode(), totalCredit);
		totalMap.put(TransactionType.GR.getCode(), totalGR);
		totalMap.put("Remaining", remaining);
		return totalMap;
	}
	
	public Map<String, BigDecimal> getSummary(Integer merchantId, int previousNmonths) {
		Map<String, BigDecimal> totalMap = new HashMap<String, BigDecimal>();
		Date currentDate = new Date();
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(currentDate);
	    cal.add(Calendar.MONTH, -previousNmonths);
	    Date prevDate = cal.getTime();
	    SearchTransactionsDto searchDto = new SearchTransactionsDto();
	    searchDto.setStartDate(prevDate);
	    searchDto.setEndDate(currentDate);
	    if(merchantId!=null && merchantId>0){
	    	searchDto.setMerchantId(merchantId);
	    }
		List<Transaction> transactions = searchTransactionsByCriteria(searchDto);
		totalMap = calculateTotal(transactions);
		return totalMap;
	}
	
	public void createDailyTransaction(DailyTransaction dailyTransaction) {
		getSession().persist(dailyTransaction);
	}
	
	@SuppressWarnings("unchecked")
	public List<DailyTransaction> getDailyTransactions(SearchTransactionsDto searchDto) {
		List<DailyTransaction> dailyTransactions= new ArrayList<DailyTransaction>();
		if(searchDto.getTransactionDate()==null) {
		    Date dateOnly = new LocalDate().toDate();
			searchDto.setTransactionDate(dateOnly);
		}
		String sql = "select dailyTxn from DailyTransaction dailyTxn "
				+ " where (:transactionDate is null or dailyTxn.transactionDate=:transactionDate) "
				+ " and (:transactionType is null or dailyTxn.transactionType=:transactionType) ";
		
		Query query = getSession().createQuery(sql);
		query.setParameter("transactionDate", searchDto.getTransactionDate()==null ? null : new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(searchDto.getTransactionDate()));
		query.setParameter("transactionType", searchDto.getDailyTransactionType()==null ? null : searchDto.getDailyTransactionType().getCode());
		dailyTransactions = query.list();
		
		return dailyTransactions;
	}
	
	public Map<String, BigDecimal> calculateDailyTotal(List<DailyTransaction> dailyTransactions) {
		Map<String, BigDecimal> totalMap = new HashMap<String, BigDecimal>();
		BigDecimal totalDebit=BigDecimal.ZERO, totalCredit=BigDecimal.ZERO;
		
		for(DailyTransaction dailyTxn : dailyTransactions) {
			if(dailyTxn.getTransactionType()==DailyTransactionType.Debit){
				totalDebit = dailyTxn.getAmount().add(totalDebit);
			}
			if(dailyTxn.getTransactionType()==DailyTransactionType.Credit){
				totalCredit = dailyTxn.getAmount().add(totalCredit);
			}

		}
		totalMap.put(TransactionType.Debit.getCode(), totalDebit);
		totalMap.put(TransactionType.Credit.getCode(), totalCredit);
		return totalMap;
	}
	
	public void deleteTransaction(int transactionId) {
		getSession().delete(getSession().get(Transaction.class, transactionId));
	}
	
}
