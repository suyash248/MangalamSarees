<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function(){
		$('.datepicker').datepicker();
		initializeDataTable();
		initializeSearchTransactionFormSubmit();
	});
	
	function initializeSearchTransactionFormSubmit(){
		spin('#searchTransactionsForm');
		$('#searchTransactionsForm').ajaxForm({
			target: '#searchTransactionsGridDiv',
			success: function(){
				initializeDataTable();
				$('#collapseSearchTxn').removeClass('in');
				$('#resultsDiv').show();
				initializeSearchTransactionFormSubmit();
			}
		});
	}
	
</script>

<div id="searchTransactionsFormDiv">
	<jsp:include page="/WEB-INF/jsp/searchTransactionsForm.jsp"></jsp:include>
</div>
<div id="searchTransactionsGridDiv">
	<jsp:include page="/WEB-INF/jsp/searchTransactionsGrid.jsp"></jsp:include>
</div>