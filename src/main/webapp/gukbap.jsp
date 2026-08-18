<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국밥 상세 주문</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body { background-color: #f8f9fa; }
    .menu-card { max-width: 650px; margin: 30px auto; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    .option-title { font-weight: bold; color: #495057; margin-top: 15px; border-bottom: 2px solid #e9ecef; padding-bottom: 5px; }
    .total-price-box { background-color: #fff3cd; border: 1px solid #ffeeba; border-radius: 10px; padding: 15px; }
    
    #gukbapCarousel { border-radius: 12px; overflow: hidden; }
    #gukbapCarousel .carousel-inner { height: 350px; }
    #gukbapCarousel .carousel-item { height: 100%; }
    #gukbapCarousel .carousel-item img { width: 100%; height: 100% !important; background-color: #e9ecef; object-fit: cover; }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1 text-dark fw-bold">🍲 국밥</span>
        <a href="menu_choice1.jsp" class="btn btn-outline-dark btn-sm">메뉴 목록으로</a>
    </div>
</nav>

<div class="container">
    <div class="card menu-card p-4 bg-white">
        
        <div id="gukbapCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://www.pigpeople.net/data/photos/20170416/art_14927036061773_f148b7.png" class="d-block w-100" alt="국밥">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>뜨끈한 국밥</h5>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="fw-bold text-dark">${not empty menu.menuName ? menu.menuName : '뜨끈한 국밥'}</h2>
        <p class="text-muted mb-2">진한 사골 육수로 끓여낸 든든한 한 끼입니다.</p>
        <h4 class="text-primary fw-bold mb-4">
            기본 가격: <span id="basePrice">${not empty menu.price ? menu.price : 9000}</span>원
        </h4>

        <form id="orderForm">
            <input type="hidden" name="menuId" value="${not empty menu.menuId ? menu.menuId : 1}">

            <div class="option-title mb-2">1. 사이즈 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="sizeOption" id="size1" value="0" data-name="보통" checked>
                <label class="form-check-label" for="size1">보통 (+0원)</label>
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input option-check" type="radio" name="sizeOption" id="size2" value="2000" data-name="특">
                <label class="form-check-label" for="size2">특 (+2,000원)</label>
            </div>

            <div class="option-title mb-2">2. 추가 토핑 (선택)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="checkbox" name="toppingOption" id="topping1" value="3000" data-name="고기많이">
                <label class="form-check-label" for="topping1">고기 많이 (+3,000원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="checkbox" name="toppingOption" id="topping2" value="500" data-name="얼큰다대기">
                <label class="form-check-label" for="topping2">얼큰 다대기 추가 (+500원)</label>
            </div>
            <div class="form-check mb-4">
                <input class="form-check-input option-check" type="checkbox" name="toppingOption" id="topping3" value="0" data-name="부추팍팍">
                <label class="form-check-label" for="topping3">부추 팍팍 (+0원)</label>
            </div>

            <div class="d-flex align-items-center mb-4">
                <label for="quantity" class="fw-bold me-3">주문 수량:</label>
                <input type="number" id="quantity" name="quantity" class="form-control text-center" value="1" min="1" max="10" style="width: 80px;">
            </div>

            <div class="total-price-box text-center mb-4">
                <span class="fs-5 text-dark">총 주문 금액: </span>
                <span id="totalPriceDisplay" class="fs-3 fw-bold text-danger">9,000</span>
                <span class="fs-5 text-dark">원</span>
            </div>

            <div>
                <button type="button" id="btnCart" class="btn btn-warning btn-lg w-100 fw-bold text-dark">🛒 장바구니 담기</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
    function calculateTotalPrice() {
        let basePrice = parseInt($("#basePrice").text());
        let optionSum = 0;

        $(".option-check:checked").each(function() {
            optionSum += parseInt($(this).val());
        });

        let quantity = parseInt($("#quantity").val());
        if (isNaN(quantity) || quantity < 1) quantity = 1;

        let totalPrice = (basePrice + optionSum) * quantity;
        $("#totalPriceDisplay").text(totalPrice.toLocaleString());
        return totalPrice;
    }

    $(document).on("change", ".option-check, #quantity", function() {
        calculateTotalPrice();
    });

    function getSelectedOptionString() {
        let optionNames = [];
        $(".option-check:checked").each(function() {
            let optionName = $(this).data("name");
            if (optionName) optionNames.push(optionName);
        });
        let quantity = $("#quantity").val();
        return optionNames.join(" / ") + " (수량: " + quantity + "개)";
    }

    $("#btnCart").click(function() {
        let finalPrice = calculateTotalPrice();
        let selectedOptions = getSelectedOptionString();
        let menuId = $("input[name='menuId']").val();

        $.ajax({
            url: "addcart.do",
            type: "POST",
            data: {
                menuId: menuId,
                selectedOptions: selectedOptions,
                finalPrice: finalPrice
            },
            success: function(response) {
                if (confirm("장바구니에 메뉴가 성공적으로 담겼습니다!\n장바구니(주문 화면)로 이동하시겠습니까?")) {
                    location.href = "cart.do";
                }
            },
            error: function() {
                alert("장바구니 담기 중 오류가 발생했습니다.");
            }
        });          

    });        
});
</script>
</body>
</html>