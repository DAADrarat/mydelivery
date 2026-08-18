<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 수정</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  body { background-color: #f8f9fa; }
  .edit-wrap {
    max-width: 600px; margin: 30px auto; padding: 35px;
    background: #fff; border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
  }
  .info-box {
    background-color: #fff3cd; border: 1px solid #ffeeba;
    border-radius: 10px; padding: 15px; margin-bottom: 25px;
  }
  .form-label { font-weight: bold; color: #495057; }
  .form-control { border-radius: 10px; padding: 12px; }
  .form-control:focus {
    border-color: #ffc107;
    box-shadow: 0 0 0 0.2rem rgba(255,193,7,0.25);
  }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 text-dark fw-bold">✏️ 주문 수정</span>
    <a href="orderlist.do" class="btn btn-outline-dark btn-sm">주문 내역으로</a>
  </div>
</nav>

<div class="edit-wrap">

  <div class="info-box text-center">
    <span class="text-dark">주문번호 </span>
    <span class="fs-4 fw-bold text-danger">${order.orderId}</span>
    <c:if test="${not empty order.finalPrice}">
      <span class="text-dark ms-3">결제금액 </span>
      <span class="fs-5 fw-bold text-danger">
        <fmt:formatNumber value="${order.finalPrice}"/>원
      </span>
    </c:if>
  </div>

  <form action="orderupdate.do" method="post">
    <input type="hidden" name="orderId" value="${order.orderId}">

    <div class="mb-3">
      <label class="form-label">배송 주소</label>
      <input type="text" name="customerAddress" class="form-control"
             value="${order.customerAddress}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">연락처</label>
      <input type="text" name="customerPhone" class="form-control"
             value="${order.customerPhone}" required>
    </div>

    
    <div class="row g-2">
      <div class="col-6">
        <a href="orderlist.do" class="btn btn-outline-secondary btn-lg w-100 fw-bold">취소</a>
      </div>
      <div class="col-6">
        <button type="submit" class="btn btn-warning btn-lg w-100 fw-bold text-dark">
          💾 수정 완료
        </button>
      </div>
    </div>
  </form>

</div>

</body>
</html>