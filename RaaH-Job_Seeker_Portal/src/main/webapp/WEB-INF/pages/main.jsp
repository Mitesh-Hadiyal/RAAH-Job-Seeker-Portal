<%@ page isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Main Page</title>
    <style>
      body{
                    background-color: #f0f1f2;
                }
                .main {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    height: 70vh;
                }

                .buttons-container button {
                    padding: 15px 30px;
                    font-size: 16px;
                }
                a{
                    text-decoration:none;
                }
                </style>
</head>

<body>
   <c:if test="${not empty errorMessage}">
    		<div class="alert alert-danger">${errorMessage}</div>
			</c:if>
    <c:if test="${not empty successMessage}">
    		<div class="alert alert-success">${successMessage}</div>
		  </c:if>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <img src="images/Logonew.png" height="40px">
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="/main">RAAH</a>
                <div class="d-flex ms-auto">
                    <a class="btn btn-primary me-2" href="/login">Log In</a>
                    <a class="btn btn-primary" href="/signup">Sign Up</a>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            For Employer
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="/logincompany">Log In</a></li>
                            <li><a class="dropdown-item" href="/signupcompany">Sign Up</a></li>
                        </ul>
                    </div>
            </div>
        </nav>

        <div class="main">
            <!-- <div class="input-group mb-3 w-50"> -->
              <!--  <input type="text" class="form-control" placeholder="Search job" aria-label="Search job"> -->
              <!--  <button class="btn btn-primary" type="button">Find jobs</button> -->

              <h4>WELCOME TO RAAH!</h4>
            <!-- </div> -->

        </div>

<!-- Footer -->

        <footer class="bg-dark text-white mt-5">
                <div class="container">
                  <div class="row text-center py-3">
                    <div class="col-md-12 d-flex justify-content-center">
                        <ul class="list-inline">
                          <li class="list-inline-item"><a href="#" class="text-white">About Us</a></li>
                          <li class="list-inline-item"><a href="#" class="text-white">Careers</a></li>
                          <li class="list-inline-item"><a href="#" class="text-white">Sitemap</a></li>
                          <li class="list-inline-item"><a href="#" class="text-white">Report Issue</a></li>
                          <li class="list-inline-item"><a href="#" class="text-white">Privacy Policy</a></li>
                          <li class="list-inline-item"><a href="#" class="text-white">Trust & Safety</a></li>
                          <li class="list-inline-item"><a href="#" class="text-white">Contact Us</a></li>
                        </ul>
                      </div>

                    <div class="text-centre col-md-12" >
                      Follow Us<br>
                      <a href="https://www.instagram.com" class="text-white mx-2">
                        <i class="fab fa-instagram"></i>
                      </a>
                      <a href="https://www.facebook.com" class="text-white mx-2">
                        <i class="fab fa-facebook"></i>
                      </a>
                      <a href="https://www.linkedin.com" class="text-white mx-2">
                        <i class="fab fa-linkedin"></i>
                      </a>
                      <a href="https://www.twitter.com" class="text-white mx-2">
                        <i class="fab fa-twitter"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </footer>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>

</html>