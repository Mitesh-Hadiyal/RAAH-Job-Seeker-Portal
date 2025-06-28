<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en"
    xmlns:th="http://www.thymeleaf.org"
>
<head>
    <meta charset="UTF-8">
    <title>Registration and Login System</title>

    <!-- Include jQuery and DataTables CSS/JS -->
                    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
                    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
                    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

</head>
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
                        overflow-y: scroll;
                        height:100vh;
                        width:80vw;
                    }
                    .userTable{
                        width:70vw;
                    }
          </style>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <img src="images/Logonew.png" height="40px">
                <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="Index.jsp">RAAH</a>
                <div class="d-flex ms-auto">

                    <a class="btn btn-primary me-2" href="/login">Log out</a>
            </div>
        </nav>

<input type="hidden" value="${userList}" id="userData">


<div class="container-fluid">
<div class="row">
    <div class="row sidebar">


        <div>
             <img src="/images/Favicon.png" class="card-img-top " width="12rem" alt="profile picture">
        </div>
        <div>
              <h5>${Company.name}</h5>
              <p>Email : ${Company.email}</p>
                <p>Mobile : ${Company.mobile}</p>
                <p>Website : ${Company.website}</p>
                <p>Address : ${Company.address}</p>
        </div>
    </div>
    <div class="content">
        <button type="button" class="btn btn-primary m-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
               + Post New Job
            </button>



        <div id="userTable" class="mx-3">
            <h2 class="mt-5">Users</h2>
            <table id="example" class="display bg-primary mt-5" width="100%"></table>
        </div>


    </div>
  </div>
</div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST" action="/addJobPost" modelAttribute="jobPost">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Job Post Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body  modal-body-scrollable"">
                        <div class="form-group mb-3">
                            <label class="form-label">Job Title</label>
                            <input type="text" name="jobTitle" class="form-control" placeholder="Enter job title"/>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Vacancies</label>
                            <input type="number" name="vacancies" class="form-control" placeholder="Enter number of vacancies" type="number"/>
                        </div>

                        <div class="form-group mb-3">
                            <label class="form-label">Education</label>
                            <input type="text" name="education" class="form-control" placeholder="Enter required education"/>
                        </div>

                         <div class="form-group mb-3">
                                <label for="language" class="form-label">Programming Languages</label>
                                <select class="form-select" id="language" name="skills" multiple>
                                    <option value="java">Java</option>
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
                            <label class="form-label">Work Mode</label>
                            <input type="text" name="work_mode" class="form-control" placeholder="Enter work mode (e.g., Remote, On-site)"/>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Experience</label>
                            <input type="text" name="experience" class="form-control" placeholder="Enter required experience"/>
                        </div>
                        <div class="form-group mb-3">
                              <label class="form-label">Date</label>
                              <input type="date" name="date" class="form-control" placeholder="Enter date..."/>
                         </div>

                        <div class="form-group mb-3">
                            <label class="form-label">Salary</label>
                            <input type="text" name="salary" class="form-control" placeholder="Enter salary" type="number"/>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" name="location" class="form-control" placeholder="Enter job location"/>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="description" class="form-control" placeholder="Enter job description"></textarea>
                        </div>
    <input type="hidden" name="company.id" value="${Company.id}"> <!-- Company ID -->

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save Job Post</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>





<script>

            var usersss= document.getElementById("userData").value;
            var cleanData = usersss.replace("User", "");
            var cData = cleanData.replace("(", "");
            var fData =  cData.replace(")", "");
            console.log("USER LIST :"+fData);
        // Input string
        const inputString = "[id=1303, firstName=asd, lastName=rwer, password=$2a$10$sX3ExiR6LRG7cgdtH8yypekpqxyeDvtspKcOxvZSG6HsViXUvsDnO, gender=Male, skills=python, address=sdsdsdccf, id=1304, firstName=qwe, lastName=tyui, password=$2a$10$EtlBHCWkV6B3RyojoGjyHeOdKz4xjfLP8WwDiPx/0r03T/ytfFde., gender=Female, skills=java, address=abcdefg]";

        // Function to parse the string and convert to an array of objects
        function parseUserString(userStr) {
            // Remove the "[" and "]" brackets
            userStr = userStr.replace(/^\[|\]$/g, "").trim();

            const users = [];
            const userStrings = userStr.split("id=");

            userStrings.forEach(userString => {
                if (userString.trim() !== "") {
                    const userObj = {};
                    const pairs = userString.split(", ");

                    pairs.forEach(pair => {
                        const [key, value] = pair.split("=");
                        userObj[key.trim()] = value;
                    });

                    users.push(userObj);
                }
            });

            return users;
        }

        // Convert the string to an array of objects
        const userArray = parseUserString(fData);

        // Initialize the DataTable with the array of objects
        $(document).ready(function() {
            $('#example').DataTable({
                data: userArray,
                columns: [
                    { title: 'First Name', data: 'firstName' },
                    { title: 'Last Name', data: 'lastName' },
                    { title: 'Gender', data: 'gender' },
                    { title: 'Skills', data: 'skills' },
                    { title: 'Mobile No', data: 'phoneNumber' },
                    { title: 'Email ID', data: 'email' },
                    { title: 'Address', data: 'address' }
                ]
            });
        });
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>