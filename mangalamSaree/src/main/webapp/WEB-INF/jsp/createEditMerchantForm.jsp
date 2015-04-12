<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="panel-group" id="addMerchantAccordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingAddMerchant">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#addMerchantAccordion" href="#collapseAddMerchant" aria-expanded="true" aria-controls="collapseAddMerchant">
					Create/Edit Merchant
				</a>
			</h4>
		</div>
		<div id="collapseAddMerchant" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingAddMerchant">
			<div class="panel-body">
				<form id="createEditMerchantForm" action="merchant/submitCreateEditMerchant" class="form-horizontal" method="post">
					<input type="hidden" name="merchantId" value="<c:out value='${merchant.merchantId}'/>"/>
					<div class="form-group">
						<label class="col-sm-2 control-label">Name</label>
						<div class="col-sm-9">
							<input type="text" name="merchantName" value="<c:out value='${merchant.merchantName}'/>" class="form-control" placeholder="Name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Phone</label>
						<div class="col-sm-9">
							<input type="text" name="phone" value="<c:out value='${merchant.phone}'/>" class="form-control" placeholder="989378920">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Address</label>
						<div class="col-sm-9">
							<input type="text" name="address" value="<c:out value='${merchant.address}'/>" class="form-control" placeholder="Civil Bazar, Dharmshala">
						</div>
					</div>			
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-9">
							<button type="submit" class="btn btn-default">Submit</button>
							<a href="<c:url value='merchant/resetMerchantForm'/>" class="btn btn-default resetMerchantFormLink">Reset</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>