<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/signup.css"/>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/common/layout/layout.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/home.css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <jsp:include page="../common/layout/header.jsp"></jsp:include>
            <!-- Registration 7 - Bootstrap Brain Component -->
            <section class="bg-light p-3 p-md-4 p-xl-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                            <div class="card border border-light-subtle rounded-4">
                                <div class="card-body p-3 p-md-4 p-xl-5">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="mb-5">
                                                <div class="text-center mb-4">
                                                    <a href="home">
                                                        <img src="${pageContext.request.contextPath}/img/icon/header/logo.jpg.png" alt="BootstrapBrain Logo" width="175" height="120">
                                                </a>
                                            </div>
                                            <h2 class="h4 text-center">Registration</h2>
                                            <h3 class="fs-6 fw-normal text-secondary text-center m-0">Enter your details to register</h3>
                                        </div>
                                    </div>
                                </div>
                                <form action="Signup" method="POST" id="signup-form">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="txtUserName" id="txtUserName" placeholder="Username" required
                                                       value="${not empty requestScope.userName ? requestScope.userName : (not empty requestScope.accountGG.email ? requestScope.accountGG.email : '')}">
                                                <label for="txtUserName" class="form-label">Username</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="txtPassword" id="txtPassword" placeholder="Password" required>
                                                <label for="txtPassword" class="form-label">Password</label>
                                                <span class="toggle-password" onclick="togglePassword('txtPassword', this)" 
                                                      style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                                                    👁️
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="txtPasswordSecond" id="txtPasswordSecond" placeholder="Re-Enter password" required>
                                                <label for="txtPasswordSecond" class="form-label">Re-Enter password</label>
                                                <span class="toggle-password" onclick="togglePassword('txtPasswordSecond', this)" 
                                                      style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                                                    👁️
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="txtFullName" id="txtFullName" placeholder="Full Name" required
                                                       value="${not empty requestScope.fullName ? requestScope.fullName : (not empty requestScope.accountGG.given_name ? requestScope.accountGG.given_name : '')}${not empty requestScope.accountGG.family_name ? requestScope.accountGG.family_name : ''}">
                                                <label for="txtFullName" class="form-label">Full Name</label>
                                            </div>
                                        </div>  
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="txtEmail" id="txtEmail" placeholder="Email" required
                                                       value="${not empty requestScope.email ? requestScope.email : (not empty requestScope.accountGG.email ? requestScope.accountGG.email : '')}">
                                                <label for="txtEmail" class="form-label">Email</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="txtPhone" id="txtPhone" placeholder="Phone" required
                                                       value="${not empty requestScope.phone ? requestScope.phone : ''}">
                                                <label for="txtPhone" class="form-label">Phone</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="txtAddress" id="txtAddress" placeholder="Address" required
                                                       value="${not empty requestScope.address ? requestScope.address : ''}">
                                                <label for="txtAddress" class="form-label">Address</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-check">
                                                <p style="color: red; font-size: 14px; font-weight: bold;">${requestScope.message}</p>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" name="iAgree" id="iAgree" required>
                                                <label class="form-check-label text-secondary" for="iAgree">
                                                    I agree to the <a href="#!" class="link-primary text-decoration-none">terms and conditions</a>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button class="btn bsb-btn-xl btn-primary" type="submit">Sign up</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-12">
                                        <hr class="mt-5 mb-4 border-secondary-subtle">
                                        <p class="m-0 text-secondary text-center">Already have an account? <a href="Login" class="link-primary text-decoration-none">Sign in</a></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <p class="mt-5 mb-5">Or continue with</p>
                                        <div class="d-flex gap-2 gap-sm-3 justify-content-center">
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/ClothingShop/LoginByGoogle&response_type=code
                                               &client_id=6921099833-mssavtev5dthku986lu1fun9d18b6tcn.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                                </svg>
                                                <span class="ms-2 fs-6">Sign in with Google</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- footer -->
        <jsp:include page="../common/layout/footer.jsp"></jsp:include>
        <script>
            function togglePassword(fieldId, element) {
                let input = document.getElementById(fieldId);
                if (input.type === "password") {
                    input.type = "text";
                    element.textContent = "🙈";
                } else {
                    input.type = "password";
                    element.textContent = "👁️";
                }
            }
        </script>
    </body>
</html>
