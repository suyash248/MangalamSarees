<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function(){
		initializeCreateEditMerchantFormSubmit();
		initializeEditMerchantForm();
		initializeDataTable();
		initializeResetMerchantForm();
	});
	
	function initializeCreateEditMerchantFormSubmit(){
		spin('#createEditMerchantForm');
		$('#createEditMerchantForm').ajaxForm({
			target: '#merchantsGridDiv',
			success: function(){
				initializeCreateEditMerchantFormSubmit();
				initializeEditMerchantForm();
				$('#collapseAddMerchant').removeClass('in');
				showMessage("Operation performed successfully.");
				initializeDataTable();
			},
			resetForm: true
		});
	}
	
	function initializeEditMerchantForm() {
		$('.editMerchantLink').on('click', function(){
			spin('#createEditMerchantForm');
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#merchantFormDiv').html(res);
				initializeCreateEditMerchantFormSubmit();
				initializeResetMerchantForm();
			});
			return false;
		});
	}
	
	function initializeResetMerchantForm() {
		$('.resetMerchantFormLink').on('click', function(){
			spin('#createEditMerchantForm');
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#merchantFormDiv').html(res);
				initializeCreateEditMerchantFormSubmit();
				initializeResetMerchantForm();
				initializeEditMerchantForm();
			});
			return false;
		});
	}
	
	function initializeDeleteMerchant() {
		$('.deleteMerchantLink').on('click', function(){
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#merchantsGridDiv').html(res);
				initializeDataTable();
			});
			return false;
		});
	}
</script>

<div id="merchantFormDiv">
	<jsp:include page="/WEB-INF/jsp/createEditMerchantForm.jsp"></jsp:include>
</div>
<div id="merchantsGridDiv">
	<jsp:include page="/WEB-INF/jsp/merchantsGrid.jsp"></jsp:include>
</div>