<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function(){
		$('.datepicker').datepicker();
		initializeDailyTransactionFormSubmit();
		initializeSearchDailyTransaction();
		initializeDataTable();
	});
	
	function initializeDailyTransactionFormSubmit(){
		spin('documet');
		$('#dailyDebitCreditForm').ajaxForm({
			target: '#dailyTransactionsGridDiv',
			success: function(){
				initializeDailyTransactionFormSubmit();
				initializeDataTable();
				$('#dailyTxnResultDiv').show();
				showMessage("Transaction saved successfully.");
			},
			resetForm: true
		});
	}
	
	function initializeSearchDailyTransaction(){
		spin('documet');
		$('#searchDailyTransactionsForm').ajaxForm({
			target: '#dailyTransactionsGridDiv',
			success: function(){
				$('#dailyTxnResultDiv').show();
				initializeDataTable();
				initializeSearchDailyTransaction();
			}
		});
	}
	
</script>

<div id="dailyTransactionsFormsDiv">

	<div id="dailyTransactionsFormDiv" class="col-sm-7">
	
		<div class="panel-group" id="dailyTxnAccordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingDailyTxn">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#dailyTxnAccordion" href="#collapseDailyTxnForm" aria-expanded="true" aria-controls="collapseDailyTxnForm">
							Debit/Credit
						</a>
					</h4>
				</div>
				<div id="collapseDailyTxnForm" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingDailyTxn">
					<div class="panel-body">
						<form id="dailyDebitCreditForm" action="dailyTransaction/submitDebitCredit" class="form-horizontal" method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">Amount</label>
								<div class="col-sm-10">
									<input type="text" name="amount" class="form-control" placeholder="50000" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Date</label>
								<div class="col-sm-3">
									<input type="text" name="transactionDate" class="form-control datepicker" placeholder="YYYY-MM-DD" required="required">
								</div>
								<label class="col-sm-4 control-label">Transaction Type</label>
								<div class="col-sm-3">
									<select name="transactionType" class="form-control" required="required">
										<c:forEach items="${dailyTransactionTypes}" var="type">
											<option value="${type.code}">${type.label}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Description</label>
								<div class="col-sm-10">
									<textarea name="description" rows="4" style="width:100%" class="form-control"></textarea>
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
	</div>
	
	<div id="dailyTransactionsSearchDiv" class="col-sm-5">
	
		<div class="panel-group" id="searchAccordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingSearch">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#searchAccordion" href="#collapseDailyTxnSearch" aria-expanded="true" aria-controls="collapseDailyTxnSearch">
							Search Transactions
						</a>
					</h4>
				</div>
				<div id="collapseDailyTxnSearch" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSearch">
					<div class="panel-body">
						<form id="searchDailyTransactionsForm" action="dailyTransaction/searchDailyTransactions" class="form-horizontal" method="post">
							<div class="form-group">					
								<label class="col-sm-5 control-label">Transaction Type</label>
								<div class="col-sm-7">
									<select name="dailyTransactionType" class="form-control">
										<option value=""></option>
										<c:forEach items="${dailyTransactionTypes}" var="type">
											<option value="${type.code}">${type.label}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label">Date</label>
								<div class="col-sm-7">
									<input type="text" name="transactionDate" class="form-control datepicker" required="required" placeholder="YYYY-MM-DD">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-5 col-sm-7">
									<button type="submit" class="btn btn-default">Search</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<div id="dailyTransactionsGridDiv">
	<jsp:include page="/WEB-INF/jsp/dailyTransactionsGrid.jsp"></jsp:include>
</div>