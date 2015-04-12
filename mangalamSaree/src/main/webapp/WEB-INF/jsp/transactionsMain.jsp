<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function(){
		initializeDatepicker();
		initializeTransactionFormSubmit();
		initializeEditTxnForm();
		initializeResetTxnForm();
		initializeDeleteTransaction();
		initializeDataTable();
	});
	
	function initializeTransactionFormSubmit(){
		spin('#debitCreditForm');
		$('#debitCreditForm').ajaxForm({
			target: '#transactionsGridDiv',
			success: function(){
				initializeTransactionFormSubmit();
				initializeEditTxnForm();
				initializeResetTxnForm();
				initializeDataTable();
				$('#collapseDebitCredit').removeClass('in');
				showMessage("Operation performed successfully.");
			},
			resetForm: true
		});
	}
	
	function initializeEditTxnForm() {
		$('.editMerchantTransactionLink').on('click', function(){
			spin('#debitCreditForm');
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#transactionsFormDiv').html(res);
				
				var mySqlDate = $('.transactionDateClass').val();
				var dateArr = mySqlDate.split('-'); // 2015-02-15 (MySQL)
				if(dateArr.length>1){
					var javaDate = dateArr[1]+'/'+dateArr[2]+'/'+dateArr[0];	// 02/15/2015 (Java)
					$('.transactionDateClass').val(javaDate);
				}
				
				initializeTransactionFormSubmit();
				initializeResetTxnForm();
				initializeDatepicker();
			});
			return false;
		});
	}
	
	function initializeResetTxnForm() {
		$('.resetDebitCreditFormLink').on('click', function(){
			spin('#debitCreditForm');
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#transactionsFormDiv').html(res);
				initializeTransactionFormSubmit();
				initializeResetTxnForm();
				initializeEditTxnForm();
				$('.datepicker').datepicker();
			});
			return false;
		});
	}
	
	function initializeDeleteTransaction() {
		$('.deleteTransactionLink').on('click', function(){
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#transactionsGridDiv').html(res);
				initializeDataTable();
			});
			return false;
		});
	}
	
</script>

<div id="transactionsFormDiv">
	<jsp:include page="/WEB-INF/jsp/transactionsForm.jsp"></jsp:include>
</div>
<div id="transactionsGridDiv">
	<jsp:include page="/WEB-INF/jsp/transactionsGrid.jsp"></jsp:include>
</div>