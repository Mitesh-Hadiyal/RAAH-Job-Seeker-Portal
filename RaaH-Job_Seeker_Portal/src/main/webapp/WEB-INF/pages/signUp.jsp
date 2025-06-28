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
             input:focus {
                         border-color: blue;
                         outline: none;
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
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="/main">RAAH</a>
                <div class="d-flex ms-auto">
                    <a class="btn btn-primary me-2" href="/login">Log In</a>
            </div>
</nav>

<div class="container">
  <div class="row col-md-8 offset-md-0" style="border: 1px solid rgba(0, 0, 0, .125);">
    <div class="card" >
      <div class="card-header">
          <h2 class="text-center">Registration</h2>
      </div>
      </div>
      <div class="card-body">
           <form id="signupForm" method="POST" action="/register" modelAttribute="user" enctype="multipart/form-data">
            <div class="form-group mb-3">
              <label class="form-label">First Name<span style="color: red;">*</span></label>
              <input
                      class="form-control"
                      placeholder="What is your first name?"
                      id="firstName"
                      name="firstName"
                      placeholder="Enter first name"
                     value="${UserEdit.firstName}"
                      type="text"
                      required
              />
              <form:errors path="firstName" cssClass="error" />
            </div>
            <div class="form-group mb-3">
              <label class="form-label">Last Name<span style="color: red;">*</span></label>
              <input
                      class="form-control"
                      placeholder="What is your last name?"
                      id="lastName"
                      name="lastName"
                      placeholder="Enter last name"
                      value="${UserEdit.lastName}"
                      type="text"
                      required
              />
            </div>
             <div class="form-group mb-3">
                          <label class="form-label">DOB<span style="color: red;">*</span></label>
                          <input
                                  class="form-control"
                                  id="dob"
                                  name="dob"
                                  placeholder="Enter Date"
                                  required
                                  type="date"
                          />
                        </div>
            <div class="form-group mb-3">
              <label class="form-label">Mobile Number<span style="color: red;">*</span></label>
              <input
                      class="form-control"
                      placeholder="Enter your mobile number"
                      id="phoneNumber"
                      name="phoneNumber"
                      placeholder="Enter phone Number"
                      type="tel"
                      required
              />

            </div>

            <div class="form-group mb-3">
              <label class="form-label">Email<span style="color: red;">*</span></label>
              <input
                      class="form-control"
                      placeholder="Tell us your Email"
                      id="email"
                      name="email"
                      placeholder="Enter email address"
                      value="${UserEdit.email}"
                      type="email"
                      required
              />
            </div>


             <div class="form-group mb-3">
                    <label for="language" class="form-label">Skills<span style="color: red;">*</span></label>
                    <select class="form-select" id="language" name="skills" multiple required>
                        <option value="java">Java</option>
                        <option value="mysql">MySQL</option>
                        <option value="mongodb">MongoDB</option>
                        <option value="contentWriter">Content-Writer</option>
                        <option value="graphicDesign">Graphic Design</option>
                        <option value="problemSolving">Problem Solving</option>
                        <option value="python">Python</option>
                        <option value="javascript">JavaScript</option>
                        <option value="csharp">C#</option>
                        <option value="cpp">C++</option>
                        <option value="ruby">Ruby</option>
                        <option value="php">PHP</option>
                        <option value="swift">Swift</option>
                        <option value="go">Go</option>
                        <option value="kotlin">Kotlin</option>
                        <option value="rust">Rust</option>
                        <option value="html">HTML</option>
                        <option value="css">CSS</option>
                        <option value="bootstrap">Bootstrap</option>
                        <option value="jQuery">jQuery</option>
                        <option value="typescript">TypeScript</option>
                        <option value="scala">Scala</option>
                        <option value="perl">Perl</option>
                        <option value="r">R</option>
                        <option value="dart">Dart</option>
                        <option value="elixir">Elixir</option>
                        <option value="haskell">Haskell</option>
                        <option value="objectivec">Objective-C</option>
                    </select>
                </div>

            <div class="form-group mb-3">
                <label class="form-label">Gender<span style="color: red;">*</span></label>
                 <input type="radio" id="male" name="gender" value="Male" checked/> <label for="male">Male:</label>
                <input type="radio" id="female" name="gender" value="Female"/><label for="female">Female:</label>
             </div>

            <div class="form-group mb-3">
              <label class="form-label">Address<span style="color: red;">*</span></label>
              <input
                      class="form-control"
                      placeholder="What is your current location?"
                      id="address"
                      name="address"
                      placeholder="Enter address"
                      type="text"
                      required
              />
            </div>


            <div class="form-group mb-3">
              <label class="form-label">Profile Picture</label>
              <input
                      class="form-control"
                      id="image"
                      name="image"
                      type="file"    />
            </div>

            <div class="form-group mb-3">
                  <label class="form-label">Resume<span style="color: red;">*</span></label>
                  <input
                          class="form-control"
                          id="resume"
                          name="resume"
                          type="file"
                          accept=".pdf"
                          required     />
             </div>



            <div class="form-group mb-3">
              <label class="form-label">Password<span style="color: red;">*</span></label>
              <input
                      class="form-control"
                      placeholder="(Minimum 4 characters)"
                      id="password"
                      name="password"
                      placeholder="Enter password"
                      th:field="*{password}"
                      type="password"
                      required minlength="4" maxlength="12" title="Password must be between 4 to 12 character"
              />
            </div>
            <div class="form-group">
					  <c:choose>
					    <c:when test="${UserEdit.id != null}">
					      <button class="btn btn-primary" type="submit" formaction="/updateUser/${UserEdit.id}">Update User</button>
					    </c:when>
					    <c:otherwise>
					      <button class="btn btn-primary" type="submit">Register</button>
					    </c:otherwise>
					  </c:choose>
					  <span>Already registered? <a href="login">Login here</a></span>
					</div>
          </form>
      </div>
    </div>
  </div>


    <div class="card cardOne" style="width: 22rem;">
      <img src="/images/Logo.png" class="card-img-top" alt="Image">
      <div class="card-body">
        <h3 class="card-title text-center mb-3">On registering, you can</h3>

        &#10004 Build your profile and let recruiters find you <br>

        &#10004 Get job postings delivered right to your email<br>

        &#10004 Find a job and grow your career<br>


      </div>
    </div>



</div>


  <script>

           function validateDOB(dob) {
               // Parse the input date
               const dobDate = new Date(dob);
               const today = new Date();

               // Calculate the age
               const ageDifMs = today - dobDate;
               const ageDate = new Date(ageDifMs);
               const age = Math.abs(ageDate.getUTCFullYear() - 1970);

               // Check if the date of birth is a future date
               if (dobDate > today) {
                   return { valid: false, message: "Date of birth cannot be a future date." };
               }

               // Check if the user is at least 18 years old
               if (age < 18) {
                   return { valid: false, message: "You must be at least 18 years old." };
               }

               // If both conditions are satisfied
               return { valid: true, message: "Date of birth is valid." };
           }

           document.getElementById('signupForm').addEventListener('submit', function(event) {
               const dobInput = document.getElementById('dob').value;
               const validation = validateDOB(dobInput);
               if (!validation.valid) {
                    event.preventDefault();
                    alert(validation.message);
               }
           });



        function validatePhoneNumber(phoneNumber) {
            // Regular expression to match a 10-digit numeric string
            const phoneRegex = /^\d{10}$/;

            // Check if the phone number matches the regex
            if (phoneRegex.test(phoneNumber)) {
                return { valid: true, message: "Phone number is valid." };
            } else {
                return { valid: false, message: "Phone number must be 10 digits only." };
            }
        }

        document.getElementById('signupForm').addEventListener('submit', function(event) {
            const phoneInput = document.getElementById('phoneNumber').value;
            const validation = validatePhoneNumber(phoneInput);

            if (!validation.valid){
                event.preventDefault();
                alert(validation.message);
            }
        });

  </script>
<script>
        // Set the max attribute of the dob input to today's date
        document.getElementById('dob').max = new Date().toISOString().split("T")[0];
    </script>
</body>
</html>