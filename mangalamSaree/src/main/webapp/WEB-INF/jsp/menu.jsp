<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function(){
		$('.listRootLink').on('click', function(){
			var iTagSelector = $(this).attr('href')+'Caret';
			$(iTagSelector).toggleClass('fa-caret-right');
			$(iTagSelector).toggleClass('fa-caret-down');
		});
	});
</script>
<div class="list-group">

	<a style="background-color:#F2F2F2" class="tree-toggler nav-header list-group-item listRootLink" data-toggle="collapse" href="#collapseMerchantTxns" aria-expanded="true"><b>Merchant & Transactions<i id="collapseMerchantTxnsCaret" style="float:right" class="fa fa-caret-right"></i></b></a>
	<div  id="collapseMerchantTxns" class="collapse listRoot">
		<%-- <p class="list-group-item disabled"><b>Operations <a style="float:right; color:grey" href="<c:url value='/home'/>" title="Home"><i class="fa fa-home fa-lg"></i></a></b></p> --%>
		<a href="<c:url value='merchant/merchantsMain'/>" id="manageMerchantMI" class="list-group-item mItem"><i class="fa fa-users"></i> Manage Merchants</a>
		<a href="<c:url value='transaction/transactionsMain'/>" id="debitCreditMI" class="list-group-item mItem"><i class="fa fa-pencil-square"></i> Manage Debit/Credit</a>
		<a href="<c:url value='transaction/transactionsSearchMain'/>" id="transactionsSearchMI" class="list-group-item mItem"><i class="fa fa-search"></i> Search Transactions</a>
	</div>
	
	<a style="background-color:#F2F2F2" class="tree-toggler nav-header list-group-item listRootLink" data-toggle="collapse" href="#collapseDailyTxns" aria-expanded="true"><b>Daily Transactions<i id="collapseDailyTxnsCaret" style="float:right" class="fa fa-caret-right"></i></b></a>
	<div  id="collapseDailyTxns" class="collapse listRoot">
		<a href="<c:url value='dailyTransaction/dailyTransactionsMain'/>" id="dailyDebitCreditMI" class="list-group-item mItem"><i class="fa fa-pencil-square-o"></i> Manage Debit/Credit</a>
	</div>
	
	<a style="background-color:#F2F2F2" class="tree-toggler nav-header list-group-item listRootLink" data-toggle="collapse" href="#collapseChangePassword" aria-expanded="true"><b>Settings<i id="collapseChangePasswordCaret" style="float:right" class="fa fa-caret-right"></i></b></a>
	<div  id="collapseChangePassword" class="collapse listRoot">
		<a href="<c:url value='/changePasswordForm'/>" id="changePasswordMI" class="list-group-item mItem"><i class="fa fa-lock"></i></i> Change Password</a>
	</div>

</div>