<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel-group" id="summaryAccordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingSummary">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#summaryAccordion" href="#collapseSummary" aria-expanded="true" aria-controls="collapseSummary">
					Summary(Last ${PREVIOUS_N_MONTHS_SUMMARY} Months)
				</a>
			</h4>
		</div>
		<div id="collapseSummary" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSummary">
			<div class="panel-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-4 control-label">Merchant : </label>
						<div class="col-sm-5">
							<select name="merchantId" id="summaryMerchantSelect" class="form-control">
								<option value="-1"></option>
								<option value="0">All</option>
								<c:forEach items="${merchants}" var="merchant">
									<option value="${merchant.merchantId}">${merchant.merchantName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Total Debit : </label>
						<div class="col-sm-8">
							<p class="form-control-static">Rs. <c:out value="${totalMap['Debit']}"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Total Credit : </label>
						<div class="col-sm-8">
							<p class="form-control-static">Rs. <c:out value="${totalMap['Credit']}"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Total GR : </label>
						<div class="col-sm-8">
							<p class="form-control-static">Rs. <c:out value="${totalMap['GR']}"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Remaining Amount : </label>
						<div class="col-sm-8">
							<p class="form-control-static">Rs. <c:out value="${totalMap['Remaining']}"/></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>