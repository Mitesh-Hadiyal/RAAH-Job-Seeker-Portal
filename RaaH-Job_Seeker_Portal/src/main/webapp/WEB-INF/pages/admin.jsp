<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker Portal</title>
    	 	<!-- Include jQuery and DataTables CSS/JS -->
                <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
                <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f1f2;
        }

        .sidebar {
            height: 100vh;
            position: fixed;
            width: 240px;
            background-color: #f8f9fa;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            color: #333;
            display: block;
        }
        .sidebar a:hover {
            background-color: #ffffff;
            color: black !important;
        }
        .content {
            margin-left: 240px;
            padding: 20px;
            overflow-y:scroll;
            position: relative;
            min-height:100%;
        }
        .mobile-sidebar-toggle {
            display: none;
        }
        #userTable {
            display:none;
        }

      a{
        color: white !important;
      }

    </style>
</head>
<body>

<div class="mobile-sidebar-toggle">
    <button class="btn btn-primary" onclick="toggleSidebar()">☰ Menu</button>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <img src="/images/Logonew.png" height="40px">
        <a class="navbar-brand ms-3" style="font-size:30px; font-weight:bold; font-family: cambria" href="Index.jsp">RAAH</a>
        <div class="d-flex ms-auto">
            <a class="btn btn-primary me-2" href="/login">Log out</a>

        </div>
    </div>
</nav>

<input type="hidden" value="${userList}" id="userData">
<input type="hidden" value="${jobAppList}" id="jobAppData">


<div class="sidebar navbar-dark bg-primary ">
    <a href="#" onclick="showUserTable()" >All Users</a>
    <a href="#" onclick="showContent('products')">All Companies</a>
    <a href="#" onclick="showContent('orders')">Order Details</a>
</div>

<div class="content">
    <div id="contentArea">

<div class="d-flex">
        <div class="card text-center mx-5" style="width: 18rem;">
          <div class="card-body text-light" style="background-color:black; border-radius:10px;">
            <h5 class="card-title mt-3">USERS</h5>
            <p class="btn btn-primary w-50 my-4" >${userCount}</p>
          </div>
        </div>

        <div class="card text-center mx-5" style="width: 18rem;">
          <div class="card-body text-light" style="background-color:black; border-radius:10px;">
            <h5 class="card-title mt-3">COMPANIES</h5>
            <p class="btn btn-primary w-50 my-4" >${companyCount}</p>
          </div>
        </div>

        <div class="card text-center mx-5" style="width: 18rem;">
          <div class="card-body text-light" style="background-color:black; border-radius:10px;">
            <h5 class="card-title mt-3">JOB POSTS</h5>
            <p class="btn btn-primary w-50 my-4" >${jobCount}</p>
          </div>
        </div>

         <div class="card text-center mx-5" style="width: 20rem;">
              <div class="card-body text-light" style="background-color:black; border-radius:10px;">
                <h5 class="card-title mt-3">JOB APPLICATIONS</h5>
                <p class="btn btn-primary w-50 my-4" >${jobAppCount}</p>
              </div>
            </div>
        </div>

        <div id="userTable">
            <h2 class="mt-5">Users</h2>
            <table id="example" class="display bg-primary mt-5" width="100%"></table>
        </div>
    </div>
</div>

<script>


            var jobappss= document.getElementById("jobAppData").value;
            var cleanData1 = jobappss.replace("JobApplications", "");
            var cData1 = cleanData1.replace("(", "");
            var fData1 =  cData1.replace(")", "");
            console.log("JOB APP LIST :"+fData1);



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
                    { title: 'Address', data: 'address' },
                    {
                         title: 'Action',
                         data: null,
                         className: "dt-center editor-delete",
                         orderable: false,
                         render: function ( data, type, row ) {
                            console.log("data ID "+row.id + type + data.email);
                             return '<form method="GET" action="/deleteemail/{'+data.email+'}" modelAttribute="user" class="form-horizontal"><button type="submit" class="btn btn-danger">Delete</button></form>';
                         }
                    }
                ]
            });
        });



        // Dummy functions for the actions (you should implement these)
        function setData(id) {
            console.log('Edit ID:', id);
        }

        function deleteRow(id) {
            console.log('Delete ID:', id);
        }

        function showUserTable()
        {
              console.log("userTable");
              document.getElementById("userTable").style.display="block";
        }
    </script>


</body>
</html>

