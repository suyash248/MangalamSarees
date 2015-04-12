<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		initializeChangePassword();
	});
	
	function validate() {
		var newPassword = $('#newPassword').val();
		var confirmPassword = $('#confirmPassword').val();
		if(newPassword.length<5 || confirmPassword.length<5){
			showError('Password must be atleast 5 characters long.');
			return false;
		}
		if(newPassword!=confirmPassword){
			showError('New password and Confirm password do not match.');
			return false;
		}
		return true;
	}
	
	function initializeChangePassword() {
		spin('#changePasswordForm');
		$('#changePasswordForm').ajaxForm({
			beforeSubmit: function(){
				var validationStatus = validate();
				if(!validationStatus){
					return false;
				}	
			},
			success: function(res){
				if(res.toString()=='false'){
					showError("Current password is not valid.");
					return false;
				} else{
					showMessage('Password changed successfully.');
				}
				initializeChangePassword();
			},
			resetForm: true
		});
	}
	
</script>
	
<div class="panel-group" id="changePasswordAccordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingChangePassword">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#changePasswordAccordion" href="#collapseChangePassword" aria-expanded="true" aria-controls="collapseChangePassword">
					Change Password
				</a>
			</h4>
		</div>
		<div id="collapseChangePassword" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingChangePassword">
			<div class="panel-body">
				<form id="changePasswordForm" action="changePasswordSubmit" class="form-horizontal" method="post">
					<div class="form-group">
						<label class="col-sm-3 control-label">Current Password</label>
						<div class="col-sm-8">
							<input type="password" id="currentPassword" name="currentPassword" class="form-control" placeholder="&#$%Bb89" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">New Password</label>
						<div class="col-sm-8">
							<input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="aA1*$)!#(%@" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Confirm Password</label>
						<div class="col-sm-8">
							<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="aA1*$)!#(%@" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-8">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>