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
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


          <style>
                body{
                    background-color: #f0f1f2;
                }
                .sidebar {
                            height: 100vh;
                            width: 20vw;
                            background-color: white;
                            padding-top: 20px;
                            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
                        }
                        .content {
                             overflow: scroll;
                            height:100vh;
                            width:80vw;
                        }
                        .search-bar {
                            max-width: 600px;
                            margin: auto;
                        }
                        .form-controls {
                            border-radius: 22px;
                            width:500px;
                            height:50px;
                        }
                        .btn-outline-success {
                            border-radius: 25px;
                        }
          </style>
</head>
<body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <img src="images/Logonew.png" height="40px">
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="/main">RAAH</a>
                <div class="d-flex ms-auto">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                              Add Education
                            </button>
                    <a class="btn btn-primary me-2" href="/main">Log out</a>
            </div>
        </nav>

<div class="container-fluid">
<div class="row">
    <div class="row sidebar">
        <div>
             <img src="images/speaker-1.png" class="card-img-top " width="12rem" alt="profile picture">
             <button class="btn btn-info mt-4" data-bs-toggle="modal" data-bs-target="#editProfileModal" style="width:240px">Edit Profile</button>

        </div>
        <div>
              <h5>Name : ${ListUser.firstName} ${ListUser.lastName}  </h5>
              <p>Gender : ${ListUser.gender}</p>
              <p>Address : ${ListUser.address}</p>
              <p>Skills : ${ListUser.skills}</p>
              <p>DOB : ${ListUser.dob}</p>
              <p>Mobile No : ${ListUser.phoneNumber}</p>
              <p>Email ID :${ListUser.email}</p>
        </div>
    </div>


    <div class="content" >

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Education Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form id="educationForm" action="/education" method="POST" >
                  <div class="mb-3">
                    <label for="degree" class="form-label">Degree</label>
                    <input type="text" class="form-control" id="degree" name="degree" required>
                  </div>
                  <div class="mb-3">
                    <label for="university" class="form-label">University</label>
                    <input type="text" class="form-control" id="university" name="university" required>
                  </div>
                  <div class="mb-3">
                    <label for="college" class="form-label">College</label>
                    <input type="text" class="form-control" id="college" name="college" required>
                  </div>
                  <div class="mb-3">
                    <label for="year" class="form-label">Year</label>
                    <input type="text" class="form-control" id="year" name="year" required>
                  </div>
                  <div class="mb-3">
                    <label for="result" class="form-label">Result</label>
                    <input type="number" class="form-control" id="result" name="result" required>
                  </div>

                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitForm()">Save</button>
              </div>
            </div>
          </div>
        </div>

        <script>
          function submitForm() {
            // Implement form submission logic here
            document.getElementById('educationForm').submit();
          }
        </script>



        <form class="d-flex justify-content-center mt-5" action="/searchJob" method="POST">
            <input  id="searchInput" name="title" class="form-controls mx-2" type="search" placeholder="Job title..." aria-label="Search">
            <input  name="email" class="form-controls mx-2" type="hidden" placeholder="Job title..." value="${ListUser.email}">

            <button id="searchBTN" class="btn btn-outline-success" type="submit" >Search</button>
        </form>

        <c:if test="${not empty jobPostListMatched}">
            <div class="row mt-5 ms-5">
                   <c:forEach var="job" items="${jobPostListMatched}">
                    <div class="col-md-6 my-3">
                        <div class="card card-custom">
                            <div class="card-body">
                                <h5 class="card-title">${job.jobTitle}</h5>
                                <p class="card-text">
                                    <i class="fas fa-map-marker-alt"></i> ${job.location}<br>
                                    <i class="fas fa-user"></i> ${job.work_mode}<br>
                                    <i class="fas fa-rupee-sign"></i> ${job.salary}<br>

                                    <b>Vacancies : </b>${job.vacancies}<br>
                                    <b>Education : </b>${job.education}<br>
                                    <b>Experience : </b>${job.experience}<br>

                                    <h3>${job.company.name}</h3>

                                </p>
                                <b>Description :</b><br>
                                ${job.description}
                                <br><br>
                                 <form method="POST" action="/apply" modelAttribute="jobApplication">
                                        <input type="hidden" value="${job.job_id}" name="jobId">
                                        <input type="hidden" value="${ListUser.email}" name="user_email">
                                        <input type="hidden" value="${job.company.email}" name="com_email">
                                        <button class="btn btn-primary" type="submit">Apply</button>
                                </form>
                            </div>
                        </div>
                    </div>
                        </c:forEach>
                </div>
        </c:if>



            <div class="row mt-5 ms-5">
                       <c:forEach var="job" items="${jobPostList}">
                        <div class="col-md-6 my-3">
                            <div class="card card-custom">
                                <div class="card-body">
                                    <h5 class="card-title">${job.jobTitle}</h5>
                                    <p class="card-text">
                                        <i class="fas fa-map-marker-alt"></i> ${job.location}<br>
                                        <i class="fas fa-user"></i> ${job.work_mode}<br>
                                        <i class="fas fa-rupee-sign"></i> ${job.salary}<br>
                                        <b>Vacancies : </b>${job.vacancies}<br>
                                        <b>Education : </b>${job.education}<br>
                                        <b>Experience : </b>${job.experience}<br>
                                        <h3>${job.company.name}</h3>

                                    </p>
                                    <b>Description :</b><br>
                                    ${job.description}
                                    <br><br>
                                     <form method="POST" action="/apply" modelAttribute="jobApplication">
                                            <input type="hidden" value="${job.job_id}" name="jobId">
                                            <input type="hidden" value="${ListUser.email}" name="user_email">
                                            <input type="hidden" value="${job.company.email}" name="com_email">
                                            <button class="btn btn-primary" type="submit">Apply</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                            </c:forEach>
                    </div>
    </div>
</div>
</div>

<!--
   <table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody>
            <tr>
                <td>${ListUser.firstName}</td>
                <td>${ListUser.lastName}</td>
                <td>${ListUser.email}</td>
                <td><a href="/getusers/${user1.id}" class="btn btn-primary">Update</a>
                <a href="/delete/${user1.id}"class="btn btn-primary">Delete</a>
                </td>
            </tr>

            <c:forEach var="job" items="${jobPostList}">
                <tr>
                    <td>${job.jobTitle}</td>
                    <td>${job.vacancies}</td>
                    <td>${job.description}</td>
                    <td>${job.education}</td>
                    <td>${job.work_mode}</td>
                    <td>${job.experience}</td>
                    <td>${job.salary}</td>
                    <td>${job.location}</td>
                    <td>${job.date}</td>
                    <td>
                        <a href="/getusers/${user1.id}" class="btn btn-primary">Apply</a>
                    </td>
                </tr>
            </c:forEach>

    </tbody>
</table>
-->
</div>


<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="editProfile" method="POST" action="/updateUser">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Job Post Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body  modal-body-scrollable"">

                                    <div class="form-group mb-3">
                                      <label class="form-label">First Name</label>
                                      <input
                                              class="form-control"
                                              id="firstName"
                                              name="firstName"
                                              placeholder="Enter first name"
                                             value="${ListUser.firstName}"
                                              type="text"
                                      />
                                    </div>
                                    <div class="form-group mb-3">
                                      <label class="form-label">Last Name</label>
                                      <input
                                              class="form-control"
                                              id="lastName"
                                              name="lastName"
                                              placeholder="Enter last name"
                                             value="${ListUser.lastName}"
                                              type="text"
                                      />
                                    </div>



                                     <div class="form-group mb-3">
                                                  <label class="form-label">DOB</label>
                                                  <input
                                                          class="form-control"
                                                          id="dob"
                                                          name="dob"
                                                          placeholder="Enter Date"
                                                           value="${ListUser.dob}"

                                                          type="date"
                                                  />
                                                </div>
                                    <div class="form-group mb-3">
                                      <label class="form-label">Phone Number</label>
                                      <input
                                              class="form-control"
                                              id="phoneNumber"
                                              name="phoneNumber"
                                              placeholder="Enter phone Number"
                                              type="Number"
                                              value="${ListUser.phoneNumber}"
                                      />
                                    </div>

                                    <div class="form-group mb-3">
                                      <label class="form-label">Email</label>
                                      <input
                                              class="form-control"
                                              id="email"
                                              name="email"
                                              placeholder="Enter email address"
                                              value="${ListUser.email}"
                                              type="email"
                                      />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="form-label">Gender :</label>

                                        <c:choose>
                                          <c:when test="${ListUser.gender eq 'Male'}">
                                              <input type="radio" id="male" name="gender" value="Male" checked="true"/> <label for="male">Male:</label>
                                              <input type="radio" id="female" name="gender" value="Female" /><label for="female">Female:</label>

                                          </c:when>
                                          <c:otherwise>
                                              <input type="radio" id="male" name="gender" value="Male" /> <label for="male">Male:</label>
                                              <input type="radio" id="female" name="gender" value="Female" checked="true"/><label for="female">Female:</label>
                                          </c:otherwise>
                                        </c:choose>
                                     </div>

                                    <div class="form-group mb-3">
                                      <label class="form-label">Address</label>
                                      <input
                                              class="form-control"
                                              id="address"
                                              name="address"
                                              placeholder="Enter address"
                                              value="${ListUser.address}"
                                              type="text"
                                      />
                                    </div>


                                      <input
                                              class="form-control "
                                              id="password"
                                              name="password"
                                              value="${ListUser.password}"
                                              type="hidden"
                                      />
                                      <input
                                              class="form-control "
                                              id="id"
                                              name="id"
                                              value="${ListUser.id}"
                                              type="hidden"
                                      />

                                      <input
                                            class="form-control "
                                            id="image"
                                            name="image"
                                            value="${ListUser.image}"
                                            type="hidden"
                                    />

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <input class="btn btn-primary" type="submit" />
                </div>
                </form>
            </div>
        </div>
    </div>





<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Enter Your Highest Education Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

        <div class="form-group mb-3">
          <label class="form-label">Institution Name</label>
          <input
                  class="form-control"
                  id="instituteName"
                  name="instituteName"
                  placeholder="Enter your Institution name"
                  type="text"
                  required
          />
        </div>

        <div class="form-group mb-3">
          <label class="form-label">Degree</label>
          <select id="degree" name="degree" width="50" required>
                  <option value="bachelor">Bachelor's</option>
                  <option value="master">Master's</option>
                  <option value="phd">PhD</option>
                  <option value="diploma">Diploma</option>
                  <option value="certificate">Certificate</option>
          </select>
        </div>

        <div class="form-group mb-3">
          <label class="form-label">Field of Study</label>
              <select id="fieldOfStudy" name="fieldOfStudy" required>
                      <option value="computerScience">Computer Science</option>
                      <option value="business">Business</option>
                      <option value="engineering">Engineering</option>
                      <option value="medicine">Medicine</option>
                      <option value="law">Law</option>
                      <option value="arts">Arts</option>
                      <option value="other">Other</option>
              </select>
        </div>


        <div class="form-group mb-3">
          <label class="form-label">Passing Year</label>
          <input
                  class="form-control"
                  id="startDate"
                  name="startDate"
                  placeholder="Enter Passing Year"
                  type="date"
                  required
          />
        </div>

        <div class="form-group mb-3">
          <label class="form-label">Grade Type</label>
          <select id="gradeType" name="gradeType" required>
              <option value="grade">Grade</option>
              <option value="percentage">Percentage</option>
              <option value="cgpa">CGPA</option>
          </select>

          <br> <input type="text" id="gradeValue" name="gradeValue" required>

        </div>

        <div class="form-group mb-3">
          <label class="form-label">Location</label>
          <input
                  class="form-control"
                  id="location"
                  name="location"
                  placeholder="Tell us where did you study"
                  type="text"
                  required
          />
        </div>




      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>




<script>


            document.addEventListener("click",function()
            {
                searchInput
                var temp = document.getElementById("searchInput").value;
                if(temp == "")
                {
                    event.preventDefault();
                }
            });


             document.getElementById('dob').max = new Date().toISOString().split("T")[0];
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

           document.getElementById('editProfile').addEventListener('submit', function(event) {
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

        document.getElementById('editProfile').addEventListener('submit', function(event) {
            const phoneInput = document.getElementById('phoneNumber').value;
            const validation = validatePhoneNumber(phoneInput);

            if (!validation.valid){
                event.preventDefault();
                alert(validation.message);
            }
        });

  </script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

</body>
</html>