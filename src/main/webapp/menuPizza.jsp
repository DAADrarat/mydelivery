<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자 상세 주문</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    body { background-color: #f8f9fa; }
    .menu-card { max-width: 650px; margin: 30px auto; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    .option-title { font-weight: bold; color: #495057; margin-top: 15px; border-bottom: 2px solid #e9ecef; padding-bottom: 5px; }
    .total-price-box { background-color: #fff3cd; border: 1px solid #ffeeba; border-radius: 10px; padding: 15px; }

    #pizzaCarousel { border-radius: 12px; overflow: hidden; }
    #pizzaCarousel .carousel-inner { height: 350px; }
    #pizzaCarousel .carousel-item { height: 100%; }
    #pizzaCarousel .carousel-item img { width: 100%; height: 100% !important; background-color: #e9ecef; object-fit: cover; }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-warning mb-4">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1 text-dark fw-bold">🍕 피자</span>
        <a href="store.jsp" class="btn btn-outline-dark btn-sm">메뉴 목록으로</a>
    </div>
</nav>

<div class="container mb-5">
    <div class="card menu-card p-4 bg-white">
        <div id="pizzaCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#pizzaCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#pizzaCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#pizzaCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#pizzaCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://www.반올림김천혁신.kr/images/1024.png" class="d-block w-100" alt="페퍼로니 피자">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>페퍼로니 피자</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.dominos.co.kr/admin/upload/goods/20200311_TI57KvOH.jpg" class="d-block w-100" alt="치즈 피자">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>치즈 피자</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.dominos.co.kr/admin/upload/goods/20200508_gH22my39.jpg" class="d-block w-100" alt="불고기 피자">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>불고기 피자</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://img1.kakaocdn.net/thumb/C305x305@2x.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20241203154528_d4d0f4e18ab646cebd8c1141edaf97d4.jpg" class="d-block w-100" alt="콤비네이션 피자">
                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded">
                        <h5>콤비네이션 피자</h5>
                    </div>
                </div>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#pizzaCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#pizzaCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <h2 class="fw-bold text-dark">피자 메뉴 선택</h2>
        <p class="text-muted mb-2">갓 구운 피자!.</p>
        
        <h4 class="text-primary fw-bold mb-4">
            기본 가격: <span id="basePrice">19000</span>원
        </h4>

        <form id="orderForm">
            <input type="hidden" name="menuId" value="${not empty menu.menuId ? menu.menuId : 201}">

            <div class="option-title mb-2">1. 피자 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="pizza1" value="0" data-name="페퍼로니 피자" checked>
                <label class="form-check-label" for="pizza1">페퍼로니 피자 (+0원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="pizza2" value="0" data-name="치즈 피자">
                <label class="form-check-label" for="pizza2">치즈 피자 (+0원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="pizza3" value="2000" data-name="불고기 피자">
                <label class="form-check-label" for="pizza3">불고기 피자 (+2,000원)</label>
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input option-check" type="radio" name="menuOption" id="pizza4" value="3000" data-name="콤비네이션 피자">
                <label class="form-check-label" for="pizza4">콤비네이션 피자 (+3,000원)</label>
            </div>

            <div class="option-title mb-2">2. 사이즈 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="sizeOption" id="size1" value="0" data-name="레귤러" checked>
                <label class="form-check-label" for="size1">레귤러(R) (+0원)</label>
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input option-check" type="radio" name="sizeOption" id="size2" value="5000" data-name="라지">
                <label class="form-check-label" for="size2">라지(L) (+5,000원)</label>
            </div>

            <div class="option-title mb-2">3. 도우 선택 (필수)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="edgeOption" id="edge1" value="0" data-name="일반도우" checked>
                <label class="form-check-label" for="edge1">일반도우 (+0원)</label>
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input option-check" type="radio" name="edgeOption" id="edge2" value="3000" data-name="치즈크러스트">
                <label class="form-check-label" for="edge2">치즈크러스트 (+3,000원)</label>
            </div>

            <div class="option-title mb-2">4. 추가 토핑 (선택)</div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="toppingOption" id="top0" value="0" data-name="선택안함" checked>
                <label class="form-check-label" for="top0">선택 안함 (+0원)</label>
            </div>
            <div class="form-check mb-2">
                <input class="form-check-input option-check" type="radio" name="toppingOption" id="top1" value="2000" data-name="치즈추가">
                <label class="form-check-label" for="top1">치즈 추가 (+2,000원)</label>
            </div>
            <div class="form-check mb-4">
                <input class="form-check-input option-check" type="radio" name="toppingOption" id="top2" value="2000" data-name="페퍼로니추가">
                <label class="form-check-label" for="top2">페퍼로니 추가 (+2,000원)</label>
            </div>

            <div class="d-flex align-items-center mb-4">
                <label for="quantity" class="fw-bold me-3">주문 수량:</label>
                <input type="number" id="quantity" name="quantity" class="form-control text-center" value="1" min="1" max="10" style="width: 80px;">
            </div>

            <div class="total-price-box text-center mb-4">
                <span class="fs-5 text-dark">총 주문 금액: </span>
                <span id="totalPriceDisplay" class="fs-3 fw-bold text-danger">19,000</span>
                <span class="fs-5 text-dark">원</span>
            </div>

            <div>
                <button type="button" id="btnCart" class="btn btn-warning btn-lg w-100 fw-bold text-dark">
                    🛒 장바구니 담기
                </button>
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
        if (isNaN(quantity) || quantity < 1) {
            quantity = 1;
        }

        let totalPrice = (basePrice + optionSum) * quantity;
        $("#totalPriceDisplay").text(totalPrice.toLocaleString());

        return totalPrice;
    }

    $(document).on("change", ".option-check, #quantity", function() {
        calculateTotalPrice();
    });

    function getSelectedOptionString() {
        let selectedMenu = $("input[name='menuOption']:checked").data("name");
        let selectedSize = $("input[name='sizeOption']:checked").data("name");
        let selectedEdge = $("input[name='edgeOption']:checked").data("name");
        let selectedTopping = $("input[name='toppingOption']:checked").data("name");
        let quantity = $("#quantity").val();

        let optArr = [selectedMenu, "사이즈: " + selectedSize, "도우: " + selectedEdge];
        if (selectedTopping && selectedTopping !== "선택안함") {
            optArr.push("토핑: " + selectedTopping);
        }

        return optArr.join(" / ") + " (수량: " + quantity + "개)";
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
                location.href = "cart.jsp";
            },
            error: function() {
                location.href = "cart.jsp";
            }
        });
    });

});
</script>
</body>
</html>