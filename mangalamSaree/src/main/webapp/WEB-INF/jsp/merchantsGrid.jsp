<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover datatable">
	<thead>
		<tr>
			<th>Name</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
	</thead>
	<c:forEach items="${merchants}" var="merchant">
		<tbody>
			<tr>
				<td><c:out value="${merchant.merchantName}"/></td>
				<td><c:out value="${merchant.phone}"/></td>
				<td><c:out value="${merchant.address}"/></td>
				<td>
					<a class="editMerchantLink" href="<c:url value='merchant/editMerchantForm?merchantId=${merchant.merchantId}'/>"><i class="fa fa-pencil"></i> Edit</a>
				</td>
				<%-- <td>
					<a class="deleteMerchantLink" href="<c:url value='merchant/deleteMerchant?merchantId=${merchant.merchantId}'/>"><i class="fa fa-times" style="color:red"></i> Delete</a>
				</td> --%>
			</tr>
		</tbody>
	</c:forEach>
</table>