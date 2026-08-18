<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="to" items="${orderList}">
  <tr>
    <td>${to.orderId}</td>
    <td>${to.selectedOptions}</td>
    <td><fmt:formatNumber value="${to.finalPrice}"/>원</td>
    <td>${to.customerAddress}</td>
    <td>
      <a href="orderedit.do?orderId=${to.orderId}">수정</a>
      <a href="ordercancel.do?orderId=${to.orderId}"
         onclick="return confirm('취소할까요?')">취소</a>
    </td>
  </tr>
</c:forEach>
</body>
</html>