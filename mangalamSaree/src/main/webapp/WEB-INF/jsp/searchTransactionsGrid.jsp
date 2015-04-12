<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<jsp:include page="/WEB-INF/jsp/transactionsGrid.jsp"></jsp:include>
</div>
<br/>
<div id="resultsDiv" style="display:none">

	<div class="panel-group" id="merchantSearchResultAccordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingMerchantSearchResultt">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#merchantSearchResultAccordion" href="#collapseMerchantSearchResult" aria-expanded="true" aria-controls="collapseMerchantSearchResult">
						Result
					</a>
				</h4>
			</div>
			<div id="collapseMerchantSearchResult" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingMerchantSearchResultt">
				<div class="panel-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label">Debit : </label>
							<div class="col-sm-7">
								<p class="form-control-static">Rs. <c:out value="${totalMap['Debit']}"/></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Credit : </label>
							<div class="col-sm-7">
								<p class="form-control-static">Rs. <c:out value="${totalMap['Credit']}"/></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">GR : </label>
							<div class="col-sm-7">
								<p class="form-control-static">Rs. <c:out value="${totalMap['GR']}"/></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Remaining : </label>
							<div class="col-sm-7">
								<p class="form-control-static">Rs. <c:out value="${totalMap['Remaining']}"/></p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>