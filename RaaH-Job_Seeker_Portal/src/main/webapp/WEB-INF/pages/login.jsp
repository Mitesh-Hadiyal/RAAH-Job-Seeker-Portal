<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en"
    xmlns:th="http://www.thymeleaf.org"
>
<head>
    <meta charset="UTF-8">
    <title>Registration and Login System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
          <style>
                body{
                       background-color: #f0f1f2;
                }

        .container {
            display: flex;
            justify-content: center;
        }

        .card {
            width: 960px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 30px;
            margin-top: 7%;
        }

        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            border-radius: 30px 30px 0 0;
            padding: 10px 20px;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {

            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }


          </style>
</head>
<body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <img src="images/Logonew.png" height="40px">
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="/main">RAAH</a>
                <div class="d-flex ms-auto">
                    <a class="btn btn-primary" href="/signup">Sign Up</a>
            </div>
        </nav>
        <br><br>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">

            <c:if test="${not empty errorMessage}">
    		<div class="alert alert-danger">${errorMessage}</div>
			</c:if>
					<c:if test="${not empty param.logout}">
    		<div class="alert alert-success">You have been logged out.</div>
		  </c:if>






            <div class="d-flex justify-content-center">



                <div class="card mx-3">
                    <div class="card-header">
                        <h2 class="text-center">New to RAAH?</h2>
                    </div>
                    <div class="card-body">
                        <p><br>
                            &#10004 Apply using RAAH profile. <br><br>
                            &#10004 Get relevant job recommendations.<br><br>
                            &#10004 Showcase profile to top companies.<br><br>
                        </p>
                        <a type="submit" href="/signup" class="btn btn-primary">Register here</a>

                    </div>
                </div>


                <div class="card mx-3">
                    <div class="card-header">
                        <h2 class="text-center">Login</h2>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="/loginaction" modelAttribute="user" class="form-horizontal">
                            <div class="form-group mb-3">
                                <label class="form-label">Email</label>
                                <input class="form-control" id="email" name="email" placeholder="Enter email address" th:field="*{email}" type="email"/>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter password"/>
                            </div>
                            <div class="form-group mb-3">
                                <button type="submit" class="btn btn-primary">Login</button>

                                <span style="margin-left:45%;">
                                    <a href="/forgot">Forgot Password</a>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>









        </div>
    </div>
</div>
</body>
</html>