<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover datatable display">
	<thead>
		<tr>
			<th>Merchant</th>
			<th>Bill/Slip No.</th>
			<th>Type</th>
			<th>Amount</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<c:forEach items="${transactions}" var="txn">
		<tbody>
			<tr>
				<td><c:out value="${txn.merchant.merchantName}"/></td>
				<td><c:out value="${txn.transactionNumber}"/></td>
				<td><c:out value="${txn.transactionType.label}"/></td>
				<td><c:out value="${txn.amount}"/></td>
				<td><c:out value="${txn.transactionDate}"/></td>
				<td>
					<a class="editMerchantTransactionLink" href="<c:url value='transaction/editMerchantTransactionForm?transactionId=${txn.transactionId}'/>"><i class="fa fa-pencil"></i> Edit</a>
				</td>
				<%-- <td>
					<a class="deleteTransactionLink" href="<c:url value='transaction/deleteTransaction?transactionId=${txn.transactionId}'/>"><i class="fa fa-times" style="color:red"></i> Delete</a>
				</td> --%>
			</tr>
		</tbody>
	</c:forEach>
</table>