<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="panel-group" id="searchTxnAccordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingSearchTxn">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#searchTxnAccordion" href="#collapseSearchTxn" aria-expanded="true" aria-controls="collapseSearchTxn">
					Search Transactions
				</a>
			</h4>
		</div>
		<div id="collapseSearchTxn" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSearchTxn">
			<div class="panel-body">
				<form id="searchTransactionsForm" action="transaction/submitSearchTransactions" class="form-horizontal" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">Bill/Slip No.</label>
						<div class="col-sm-9">
							<input type="text" name="transactionNumber" class="form-control" placeholder="24234">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Merchant</label>
						<div class="col-sm-4">
							<select name="merchantId" class="form-control">
								<option value=""></option>
								<c:forEach items="${merchants}" var="merchant">
									<option value="${merchant.merchantId}">${merchant.merchantName}</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-2 control-label">Transaction Type</label>
						<div class="col-sm-3">
							<select name="transactionType" class="form-control">
								<option value=""></option>
								<c:forEach items="${transactionTypes}" var="type">
									<option value="${type.code}">${type.label}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">From</label>
						<div class="col-sm-3">
							<input type="text" name="startDate" class="form-control datepicker" required="required" placeholder="Start date..">
						</div>
						<label class="col-sm-2 control-label">To</label>
						<div class="col-sm-3">
							<input type="text" name="endDate" class="form-control datepicker" required="required" placeholder="End date..">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Min. Amount</label>
						<div class="col-sm-3">
							<input type="text" name="minAmount" class="form-control" placeholder="Min amount..">
						</div>
						<label class="col-sm-2 control-label">Max. Amount</label>
						<div class="col-sm-3">
							<input type="text" name="maxAmount" class="form-control" placeholder="Max amount..">
						</div>
					</div>
							
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-9">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>