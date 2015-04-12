<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-sm-12">
	<table class="table table-hover datatable display">
		<thead>
			<tr>
				<th>Amount</th>
				<th>Type</th>
				<th>Date</th>
				<th>Description</th>
				<!-- <th>Action</th> -->
			</tr>
		</thead>
		<c:forEach items="${dailyTransactions}" var="txn">
			<tbody>
				<tr>
					<td><c:out value="${txn.amount}"/></td>
					<td><c:out value="${txn.transactionType.label}"/></td>
					<td><c:out value="${txn.transactionDate}"/></td>
					<td><c:out value="${txn.description}"/></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>

	<br/>
	<div id='dailyTxnResultDiv'>
		<div class="panel-group" id="dailyTxnResultAccordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingDailyTxnResult">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#dailyTxnResultAccordion" href="#collapseDailyTxnResult" aria-expanded="true" aria-controls="collapseDailyTxnResult">
							Result
						</a>
					</h4>
				</div>
				<div id="collapseDailyTxnResult" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingDailyTxnResult">
					<div class="panel-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">Debit</label>
								<div class="col-sm-10">
									<p class="form-control-static">Rs. <c:out value="${totalMap['Debit']}"/></p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Credit</label>
								<div class="col-sm-10">
									<p class="form-control-static">Rs. <c:out value="${totalMap['Credit']}"/></p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>