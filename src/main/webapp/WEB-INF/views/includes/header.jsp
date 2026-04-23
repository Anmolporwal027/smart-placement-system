<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', sans-serif; }
        .navbar { background: linear-gradient(90deg, #1e3a8a, #2563eb); }
        .ai-card { border-left: 5px solid #8b5cf6; background: #f5f3ff; }
        .glass-card { background: white; border-radius: 15px; border: none; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        /* Smooth scrolling for mobile */
        html { scroll-behavior: smooth; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark mb-4 sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">
            <i class="fas fa-microchip me-2"></i><span class="d-none d-sm-inline">Smart Placement System</span><span class="d-inline d-sm-none">Placement</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="ms-auto pt-2 pt-lg-0">
                <c:if test="${not empty sessionScope.user or isPO}">
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm rounded-pill px-3 w-100 w-lg-auto">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</nav>
<!-- Required for Toggler -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>