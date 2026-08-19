<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body { background-color: #f8f9fa; }
  .list-wrap {
    max-width: 900px; margin: 30px auto; padding: 25px;
    background: #fff; border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
  }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 text-dark fw-bold">📋 주문 내역</span>
    <a href="menu.do" class="btn btn-outline-dark btn-sm">메뉴로</a>
  </div>
</nav>

<div class="list-wrap">

<c:choose>
  <c:when test="${empty orderList}">
    <div class="text-center py-5">
      <p class="text-muted fs-5 mb-4">주문 내역이 없습니다.</p>
      <a href="menu.do" class="btn btn-warning fw-bold">메뉴 보러가기</a>
    </div>
  </c:when>

  <c:otherwise>
    <table class="table table-bordered align-middle text-center">
      <thead class="table-warning">
        <tr>
          <th style="width:70px;">주문번호</th>
          <th>주문 내용</th>
          <th style="width:110px;">금액</th>
          <th>배송지</th>
          <th style="width:130px;">연락처</th>  
          <th style="width:130px;">관리</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="to" items="${orderList}">
          <tr>
            <td>${to.orderId}</td>
            <td class="text-start">${to.selectedOptions}</td>
            <td class="fw-bold text-danger">
              <fmt:formatNumber value="${to.finalPrice}"/>원
            </td>
            <td class="text-start">${to.customerAddress}</td>
            <td>${to.customerPhone}</td> 
            <td>
              <a href="orderedit.do?orderId=${to.orderId}"
                 class="btn btn-sm btn-outline-primary">수정</a>
              <a href="ordercancel.do?orderId=${to.orderId}"
                 class="btn btn-sm btn-outline-danger"
                 onclick="return confirm('주문을 취소할까요?')">취소</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:otherwise>
</c:choose>

</div>

</body>
</html>