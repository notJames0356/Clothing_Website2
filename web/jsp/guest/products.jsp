<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/common/layout/layout.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/products.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- header -->
        <jsp:include page="../common/layout/header.jsp"></jsp:include>

        <!-- body -->
        <div class="container">
            <!-- title page -->
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Products</h1>
                </div>
            </div>
            <!-- search bar -->
            <div class="row mt-3">
                <div class="col-12">
                    <div class="d-flex justify-content-center">
                        <input id="searchInput" class="form-control w-50" type="search" placeholder="Search products..." aria-label="Search"/>
                    </div>
                </div>
            </div>

            <!-- gender -->
            <div class="row mt-3">
                <div class="col-12 d-flex justify-content-center">
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="productType" id="male" value="male"/>
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="productType" id="female" value="female"/>
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="productType" id="unisex" value="unisex"/>
                        <label class="form-check-label" for="unisex">Unisex</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="productType" id="all" value="" checked/>
                        <label class="form-check-label" for="all">All</label>
                    </div>
                </div>
            </div>

            <!-- sort -->
            <div class="row mt-3">
                <div class="col-12 d-flex justify-content-end">
                    <select class="form-select w-auto shadow-sm" id="sortSelect">
                        <option value="" selected disabled="true">Sort Options</option>
                        <option value="price_asc">Price: Low to High</option>
                        <option value="price_desc">Price: High to Low</option>
                        <option value="newest">Newest</option>
                        <option value="oldest">Oldest</option>
                    </select>
                </div>
            </div>

            <div class="row mt-3">
                <!-- Filter sidebar (Types and Brands) -->
                <div class="col-md-3">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header">
                            <h3 class="mb-0">Filter Products</h3>
                        </div>
                        <div class="accordion" id="fancySidebar">
                            <!-- Types -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingTop">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#topCollapse" aria-expanded="false" aria-controls="topCollapse">
                                        Types
                                    </button>
                                </h2>
                                <div id="topCollapse" class="accordion-collapse collapse" aria-labelledby="headingTop">
                                    <div class="accordion-body">
                                        <div class="list-group">
                                            <label class="p-1">
                                                <input class="form-check-input me-2" type="radio" name="type" value="" checked/>
                                                All
                                            </label>
                                            <c:forEach items="${listT}" var="t">
                                                <label class="p-1">
                                                    <input class="form-check-input me-2" type="radio" name="type" value="${t.type_id}"/>
                                                    ${t.type_name} 
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Brand -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingBrand">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#brandCollapse" aria-expanded="false" aria-controls="brandCollapse">
                                        Brand
                                    </button>
                                </h2>
                                <div id="brandCollapse" class="accordion-collapse collapse" aria-labelledby="headingBrand">
                                    <div class="accordion-body">
                                        <div class="list-group">
                                            <label class="p-1">
                                                <input class="form-check-input me-2" type="radio" name="brand" value="" checked/>
                                                All
                                            </label>
                                            <c:forEach items="${listBrand}" var="b">
                                                <label class="p-1">
                                                    <input class="form-check-input me-2" type="radio" name="brand" value="${b}"/>
                                                    ${b}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Products -->
                <div class="col-lg-9">
                    <div class="row" id="productContainer">
                        <!-- Sản phẩm sẽ được load bằng AJAX -->
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="col-12 mt-4">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <!-- Phân trang sẽ được cập nhật bằng AJAX -->
                    </ul>
                </nav>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../common/layout/footer.jsp"></jsp:include>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/JS/guest/products.js"></script>
    </body>
</html>