<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body {
	background-color: #f8f9fa;
}

.order-wrap {
	max-width: 650px;
	margin: 30px auto;
	padding: 35px;
	background: #fff;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.check-circle {
	width: 90px;
	height: 90px; /* 가로세로 같게 → 정사각형 */
	border-radius: 50%; /* ← 이게 동그라미로 만드는 핵심 */
	background: #ffc107; /* 노란 배경 */
	display: flex;
	align-items: center; /* 세로 가운데 */
	justify-content: center; /* 가로 가운데 */
	font-size: 48px; /* ✓ 크기 */
	margin: 0 auto 20px; /* 좌우 auto = 화면 중앙 정렬 */
	animation: pop 0.5s ease-out; /* 뿅 하고 나타나는 효과 */
}

@keyframes pop {
  0%   { transform: scale(0);    opacity: 0; }
  70%  { transform: scale(1.15); opacity: 1; }
  100% { transform: scale(1); }
}
.info-title {
	font-weight: bold;
	color: #495057;
	border-bottom: 2px solid #e9ecef;
	padding-bottom: 5px;
	margin-top: 25px;
}

.opt {
	font-size: 12px;
	color: #888;
}

.total-price-box {
	background-color: #fff3cd;
	border: 1px solid #ffeeba;
	border-radius: 10px;
	padding: 15px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-dark bg-warning mb-4">
		<div class="container-fluid">
			<span class="navbar-brand mb-0 h1 text-dark fw-bold"> 마이딜리버리</span> <a
				href="login.jsp" class="btn btn-outline-dark btn-sm">로그아웃</a>
		</div>
	</nav>

	<div class="order-wrap">

		<div class="text-center mb-4">
			<div class="check-circle">✓</div>
			<h2 class="fw-bold text-dark">주문이 완료되었습니다</h2>
			<p class="text-muted">맛있게 드세요!</p>
		</div>

		<div class="info-title mb-2">주문 내역</div>
		<table class="table table-bordered align-middle text-center mb-4">
			<thead class="table-warning">
				<tr>
					<th>메뉴</th>
					<th style="width: 80px;">수량</th>
					<th style="width: 130px;">금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="to" items="${list}">
					<tr>
						<td class="text-start"><span class="fw-bold">${to.menuName}</span>
							<c:if test="${not empty to.optionText}">
								<br>
								<span class="opt">${to.optionText}</span>
							</c:if></td>
						<td>${to.qty}</td>
						<td class="fw-bold"><fmt:formatNumber value="${to.itemTotal}" />원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="total-price-box text-center mb-4">
			<span class="fs-5 text-dark">총 결제금액: </span> <span
				class="fs-3 fw-bold text-danger"> <fmt:formatNumber
					value="${total}" />원
			</span>
		</div>

		<div class="row g-2">
			<div class="col-4">
				<a href="logout.do"
					class="btn btn-outline-secondary btn-lg w-100 fw-bold">로그아웃</a>
			</div>
			<div class="col-4">
				<a href="orderlist.do"
					class="btn btn-outline-warning btn-lg w-100 fw-bold text-dark">📋
					주문 내역</a>
			</div>
			<div class="col-4">
				<a href="menu.do"
					class="btn btn-warning btn-lg w-100 fw-bold text-dark">🍕 더 주문</a>
			</div>
		</div>

	</div>

</body>
</html>