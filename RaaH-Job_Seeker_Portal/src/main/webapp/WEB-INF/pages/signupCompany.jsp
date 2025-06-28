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
        .cardOne {
                    position: fixed;
                    left: 67%;
                    top: 50%;
                    transform: translateY(-50%);
                    padding: 10px;
                    border-radius: 10px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
                    margin: 20px;
                }
    </style>

</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-5">
            <div class="container-fluid">
                <img src="images/Logonew.png" height="40px">
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="Index.jsp">RAAH</a>
                <div class="d-flex ms-auto">
                    <a class="btn btn-primary me-2" href="/logincompany">Log In</a>
            </div>
        </nav>
<div class="container">
  <div class="row col-md-8 offset-md-0" style="border: 1px solid rgba(0, 0, 0, .125)">
    <div class="card">
      <div class="card-header">
          <h2 class="text-center">Registration</h2>
      </div>
      </div>
      <div class="card-body">

            <form method="POST" action="/registercompany" modelAttribute="company" enctype="multipart/form-data">
                               <div class="form-group mb-3">
                                   <label class="form-label">Name</label>
                                   <input class="form-control" id="name" name="name" placeholder="Enter company name" type="text" required />
                               </div>
                               <div class="form-group mb-3">
                                   <label class="form-label">Email</label>
                                   <input class="form-control" id="email" name="email" placeholder="Enter email address" type="email" required />
                               </div>
                               <div class="form-group mb-3">
                                   <label class="form-label">Password</label>
                                   <input class="form-control" id="password" name="password" placeholder="Enter password" type="password" required minlength="4" maxlength="12" title="Password must be between 4 to 12 character" />
                               </div>
                               <div class="form-group mb-3">
                                   <label class="form-label">Mobile</label>
                                   <input class="form-control" id="mobile" name="mobile" placeholder="Enter mobile number" type="text" required />
                               </div>
                               <div class="form-group mb-3">
                                   <label class="form-label">Address</label>
                                   <input class="form-control" id="address" name="address" placeholder="Enter address" type="text" required />
                               </div>

                               <div class="form-group mb-3">
                                   <label class="form-label">Established Year</label>
                                   <input class="form-control" id="establishedYear" name="established_year" placeholder="Enter established year" type="date" required/>
                               </div>
                               <div class="form-group mb-3">
                                   <label class="form-label">Website</label>
                                   <input class="form-control" id="website" name="website" placeholder="Enter website URL" type="text" required/>
                               </div>
                               <div class="form-group mb-3">
                                             <label class="form-label">Profile Picture</label>
                                             <input
                                                     class="form-control"
                                                     id="image"
                                                     name="image"
                                                     type="file"
                                                     required

                                             />
                                           </div>
                               <div class="form-group">
                                   <button class="btn btn-primary" type="submit">Register</button>
                                   <span>Already registered? <a href="/logincompany">Login here</a></span>
                               </div>
                           </form>
      </div>
    </div>



     <div class="card cardOne" style="width: 22rem;">
          <img src="/images/Logo.png" class="card-img-top" alt="Image">
          <div class="card-body">
            <h3 class="card-title text-center mb-3">On registering, you can</h3>

              &#10004 Build your profile and start looking for candidates <br>

                    &#10004 Get the candidates list at your finger tip<br>

                    &#10004 Find and hire the right talent with us<br>


          </div>
        </div>



  </div>
</div>
</body>
</html>