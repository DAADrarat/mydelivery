<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE HTML>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>

<script type="text/javascript">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card login-card" style="width: 380px;">
        <div class="card-body p-4">

            <div class="logo-circle">
                <i class="bi bi-bicycle"></i>
            </div>
            <h3 class="text-center fw-bold mb-1">"🍗고민하지마. 음식 식는다🍕"</h3>
            <p class="text-center text-muted mb-4">신호등 색은 사치일 뿐. 민영배달, 지금 시작합니다🏍️</p>

            <c:if test="${not empty msg}">
                <script>
                	alert("${msg}");
                </script>
            </c:if>

            <form action="login.do" method="post">
                <div class="mb-3">
                    <label class="form-label fw-semibold">아이디</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0" style="border-radius: 12px 0 0 12px;">
                            <i class="bi bi-person"></i>
                        </span>
                        <input type="text" name="customerId" class="form-control border-start-0" style="border-radius: 0 12px 12px 0;" required>
                    </div>
                </div>
                <div class="mb-4">
                    <label class="form-label fw-semibold">비밀번호</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0" style="border-radius: 12px 0 0 12px;">
                            <i class="bi bi-lock"></i>
                        </span>
                        <input type="password" name="customerPw" class="form-control border-start-0" style="border-radius: 0 12px 12px 0;" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-delivery w-100">
                    <i class="bi bi-box-arrow-in-right me-1"></i> 로그인
                </button>
            </form>

           

        </div>
    </div>
</div>

>>>>>>> branch 'main' of https://github.com/DAADrarat/mydelivery.git
</body>
</html>