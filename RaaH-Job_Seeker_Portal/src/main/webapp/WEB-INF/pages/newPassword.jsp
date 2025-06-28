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
          </style>
</head>
<body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <img src="images/Logonew.png" height="40px">
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="Index.jsp">RAAH</a>
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

            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Login</h2>
                </div>
                <div class="card-body">
                    <form
                        method="POST" action="/savepassword" modelAttribute="user"
                        class="form-horizontal"
                    >
                       <div class="form-group mb-3">
              <label class="form-label">Email</label>
              <input
                      class="form-control"
                      id="email"
                      name="email"
                      placeholder="Enter email address"
                      type="email"
              />
            </div>

                        <div class="form-group mb-3">
                            <label class="control-label"> Password</label>
                            <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    class="form-control"
                                    placeholder="Enter password"
                            />
                        </div>
                        <div class="form-group mb-3 d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary" style="width:150px" >Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>