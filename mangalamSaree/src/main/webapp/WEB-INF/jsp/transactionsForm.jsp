<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="sf"  uri="http://www.springframework.org/tags/form"%>

<div class="panel-group" id="debitCreditAccordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingDebitCredit">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#debitCreditAccordion" href="#collapseDebitCredit" aria-expanded="true" aria-controls="collapseDebitCredit">
					Debit/Credit
				</a>
			</h4>
		</div>
		<div id="collapseDebitCredit" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingDebitCredit">
			<div class="panel-body">
				<form id="debitCreditForm" action="transaction/submitDebitCredit" class="form-horizontal" method="post">
					<input type="hidden" name="transactionId" value="<c:out value='${transaction.transactionId}'/>"/>
					<div class="form-group">
						<label class="col-sm-2 control-label">Bill/Slip No.</label>
						<div class="col-sm-9">
							<input type="text" name="transactionNumber" value="<c:out value='${transaction.transactionNumber}'/>" class="form-control" placeholder="24234" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Date</label>
						<div class="col-sm-3">
							<input type="text" name="transactionDate" value="<c:out value='${transaction.transactionDate}'/>" class="form-control datepicker transactionDateClass" placeholder="YYYY-MM-DD" required="required">
						</div>
						<label class="col-sm-2 control-label">Amount</label>
						<div class="col-sm-4">
							<input type="text" name="amount" value="<c:out value='${transaction.amount}'/>" class="form-control" placeholder="50000" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Merchant</label>
						<div class="col-sm-4">
							<c:set var="savedMerchantId"><c:out value='${transaction.merchant.merchantId}'/></c:set>
							<select name="merchant.merchantId" value="<c:out value='${savedMerchantId}'/>" class="form-control" required="required">
								<c:forEach items="${merchants}" var="merchant">
									<c:choose>
										<c:when test="${merchant.merchantId==savedMerchantId}">
											<option value="${merchant.merchantId}" selected="selected">${merchant.merchantName}</option>
										</c:when>
										<c:otherwise>
											<option value="${merchant.merchantId}">${merchant.merchantName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-2 control-label">Transaction Type</label>
						<div class="col-sm-3">
							<c:set var="savedCode"><c:out value='${transaction.transactionType.code}'/></c:set>
							<select name="transactionType" value="<c:out value='${savedCode}'/>" class="form-control" required="required">
								<c:forEach items="${transactionTypes}" var="type">
									<c:choose>
										<c:when test="${type.code==savedCode}">
											<option value="${type.code}" selected="selected">${type.label}</option>
										</c:when>
										<c:otherwise>
											<option value="${type.code}">${type.label}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>		
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-9">
							<button type="submit" class="btn btn-default">Submit</button>
							<a class="btn btn-default resetDebitCreditFormLink" href="<c:out value='transaction/resetMerchantTransactionForm'/>">Reset</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>