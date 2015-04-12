<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script>
	$(function(){
		initializeMI();
		initializeSummary();
	});
	
	function initializeMI(){
		spin('#rightbody');
		$('a.mItem').on('click', function(){
			var url = $(this).prop('href');
			$.post(url, function(res){
				$('#rightbody').html(res);
			});
			return false;
		});
	}
	
	function initializeSummary(){
		spin('#rightbody');
		$('#summaryMerchantSelect').on('change', function(){
			var url = "<c:url value='transaction/getSummaryByMerchant'/>"+"?merchantId="+$(this).val();
			$.post(url, function(res){
				$('#summaryDiv').html(res);
				initializeSummary();
			});
		});
	}
	
</script>
<%-- 
<p style="color:red">
	<% 
			if(session.getAttribute("authEx") !=null) {
				out.println(session.getAttribute("authEx"));
			} 
			if(session.getAttribute("accessDeniedMsg") !=null) {
				out.println(session.getAttribute("accessDeniedMsg"));
			} 
	%>
</p> --%>

<div id="summaryDiv">
	<jsp:include page="/WEB-INF/jsp/lastNmonthsSummary.jsp"></jsp:include>
</div>