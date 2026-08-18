<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
  body { background-color: #f8f9fa; }
  .cart-wrap {
    max-width: 900px; margin: 30px auto; padding: 25px;
    background: #fff; border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
  }
  .table thead th {
    background-color: #ffc107;
    color: #212529;
  }
  .btn-qty {
    width: 28px; height: 28px; padding: 0;
    line-height: 1; font-weight: bold;
  }
  .opt { font-size: 12px; color: #888; }
  .total-price-box {
    background-color: #fff3cd; border: 1px solid #ffeeba;
    border-radius: 10px; padding: 15px;
  }
  #msg { display: none; }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1 text-dark fw-bold">🛒 장바구니</span>
        <a href="store.jsp" class="btn btn-outline-dark btn-sm">메뉴 목록으로</a>
    </div>
</nav>

<div class="cart-wrap">

<div id="msg" class="alert alert-success py-2"></div>

<div id="cart-area">
<c:choose>
  <c:when test="${empty list}">
    <div class="text-center py-5">
      <p class="text-muted fs-5 mb-4">장바구니가 비어있습니다</p>
      <a href="menu.do" class="btn btn-warning fw-bold">메뉴 보러가기</a>
    </div>
  </c:when>

  <c:otherwise>
    <table class="table table-bordered align-middle text-center">
      <thead>
        <tr>
          <th>메뉴</th><th style="width:150px;">수량</th>
          <th style="width:130px;">금액</th><th style="width:80px;">삭제</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="to" items="${list}">
        <tr id="row-${to.menuId}">
          <td class="text-start">
            <span class="fw-bold">${to.menuName}</span>
            <c:if test="${not empty to.optionText}">
              <br><span class="opt">${to.optionText}</span>
            </c:if>
          </td>
          <td>
            <button type="button" class="btn btn-outline-secondary btn-sm btn-qty"
                    data-menuid="${to.menuId}" data-delta="-1">-</button>
            <span id="qty-${to.menuId}" class="mx-2">${to.qty}</span>
            <button type="button" class="btn btn-outline-secondary btn-sm btn-qty"
                    data-menuid="${to.menuId}" data-delta="1">+</button>
          </td>
          <td id="item-${to.menuId}" class="fw-bold text-danger">
            <fmt:formatNumber value="${to.itemTotal}"/>원
          </td>
          <td>
            <a href="#" class="btn btn-sm btn-outline-danger btn-del"
               data-menuid="${to.menuId}">X</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <div class="total-price-box text-center mb-4">
      <span class="fs-5 text-dark">총 결제금액: </span>
      <span id="grand-total" class="fs-3 fw-bold text-danger">
        <fmt:formatNumber value="${total}"/>원
      </span>
    </div>

    <div class="row g-2">
      <div class="col-6">
        <a href="menu.do?storeId=2"
           class="btn btn-outline-warning btn-lg w-100 fw-bold text-dark">계속 쇼핑</a>
      </div>
      <div class="col-6">
        <a href="order.do?cmd=form"
           class="btn btn-warning btn-lg w-100 fw-bold text-dark">🚀 주문하기</a>
      </div>
    </div>
  </c:otherwise>
</c:choose>
</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(function() {

    // 숫자 3자리 콤마
    function comma(n) {
        return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function showMsg(text) {
        $("#msg").text(text).fadeIn(150).delay(1200).fadeOut(400);
    }

    // ===== 수량 변경 =====
    $(document).on("click", ".btn-qty", function() {
        var menuId = $(this).data("menuid");
        var delta  = $(this).data("delta");
        var cur    = parseInt($("#qty-" + menuId).text());
        var qty    = cur + delta;

        if (qty < 1) {
            if (!confirm("수량이 0이 됩니다. 삭제할까요?")) return;
        }

        $.ajax({
            url: "cart.do",
            type: "post",
            data: { cmd: "update", menuId: menuId, qty: qty },
            dataType: "json"
        })
        .done(function(res) {
            if (res.removed) {
                $("#row-" + menuId).fadeOut(200, function() { $(this).remove(); });
                showMsg("삭제되었습니다.");
            } else {
                $("#qty-" + menuId).text(res.qty);
                $("#item-" + menuId).text(comma(res.itemTotal) + "원");
            }
            $("#grand-total").text(comma(res.total) + "원");

            if (res.empty) location.reload();   // 다 비면 "비어있습니다" 화면으로
        })
        .fail(function() {
            alert("처리 중 오류가 발생했습니다.");
        });
    });

    // ===== 삭제 =====
    $(document).on("click", ".btn-del", function(e) {
        e.preventDefault();
        if (!confirm("삭제할까요?")) return;

        var menuId = $(this).data("menuid");

        $.ajax({
            url: "cart.do",
            type: "post",
            data: { cmd: "delete", menuId: menuId },
            dataType: "json"
        })
        .done(function(res) {
            $("#row-" + menuId).fadeOut(200, function() { $(this).remove(); });
            $("#grand-total").text(comma(res.total) + "원");
            showMsg("삭제되었습니다.");

            if (res.empty) setTimeout(function() { location.reload(); }, 600);
        })
        .fail(function() {
            alert("처리 중 오류가 발생했습니다.");
        });
    });

});
</script>

</body>
</html>