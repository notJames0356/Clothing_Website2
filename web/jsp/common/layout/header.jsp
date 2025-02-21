<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- header -->

<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <h4 class="text-center">
            <a class="text-decoration-none text-white" href="home"
               >ONLINE SHOP</a
            >
        </h4>
        <hr class="my-3" />
        <div
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
            >
            <ul
                class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
                >
                <li class="nav-item">
                    <a
                        class="nav-link px-2 link-dark main-link"
                        id="allProducts"
                        href="products"
                        >
                        All Products
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle px-2 link-dark main-link"
                        id="topDropdown"
                        >
                        Top
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="top/shirt.html">T-Shirts</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="top/jackets.html">Jackets</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="top/hoodies.html">Hoodies</a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle px-2 link-dark main-link"
                        id="bottomDropdown"
                        >
                        Bottom
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="bottom/jeans.html">Jeans</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="bottom/shorts.html">Shorts</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="bottom/skirts.html">Skirts</a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle px-2 link-dark main-link"
                        id="accessoriesDropdown"
                        >
                        Accessories
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="accessories/hats.html">Hats</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="accessories/bags.html">Bags</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="accessories/jewelry.html"
                               >Jewelry</a
                            >
                        </li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle px-2 link-dark main-link"
                        id="accessoriesDropdown"
                        >
                        Gender
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="accessories/hats.html">Male</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="accessories/bags.html"
                               >Female</a
                            >
                        </li>
                        <li>
                            <a class="dropdown-item" href="accessories/jewelry.html"
                               >Unisex</a
                            >
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="cart me-3">
                <a href="cart.html" class="d-block link-dark text-decoration-none">
                    <img
                        class="border"

                        src="${pageContext.request.contextPath}/img/icon/header/icons8-shopping-cart-100.png"

                        src="${pageContext.request.contextPath}/img/common/icon/header/icons8-shopping-cart-100.png"

                        alt="cart-icon"
                        />
                </a>
            </div>

            <div class="dropdown text-end user-services">
                <a
                    class="d-block link-dark text-decoration-none"
                    id="dropdownUser"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                    >
                    <!-- nếu chưa đăng nhập src giữ nguyên -->
                    <!-- sau khi đăng nhập đổi lại thành  icons8-male-user-100.png -->
                    <img

                        src="${pageContext.request.contextPath}/img/icon/header/icons8-user-not-found-100.png"

                        src="${pageContext.request.contextPath}/img/common/icon/header/icons8-user-not-found-100.png"

                        alt="user-icon"
                        class="border"
                        />
                </a>
                <ul class="dropdown-menu">
                    <!-- Không đăng nhập -->
                    <li id="loginItem">
                        <a class="dropdown-item" href="#">Login</a>
                    </li>
                    <li id="signupItem">
                        <a class="dropdown-item" href="#">Sign up</a>
                    </li>

                    <!-- Khi đã đăng nhập -->
                    <li id="profileItem" class="d-none">
                        <a class="dropdown-item" href="#">Profile</a>
                    </li>
                    <li id="logoutItem" class="d-none">
                        <a class="dropdown-item" href="#">Sign out</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>