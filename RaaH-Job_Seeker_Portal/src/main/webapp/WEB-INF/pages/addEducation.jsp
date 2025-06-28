<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en"
  xmlns:th="http://www.thymeleaf.org"
>
<head>
    <meta charset="UTF-8">
    <title>Add Education</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" th:href="@{/index}">Education Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/addEducation">Add Education</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<br /><br /><br />
<div class="container">
  <div class="row col-md-8 offset-md-2">
    <div class="card">
      <div class="card-header">
          <h2 class="text-center">Add Education</h2>
      </div>
      <div class="card-body">
        <form:form method="POST" action="/addEducation" modelAttribute="education">
          <div class="form-group mb-3">
            <label class="form-label">Degree</label>
            <form:input path="degree" cssClass="form-control" placeholder="Enter degree"/>
          </div>
          <div class="form-group mb-3">
            <label class="form-label">University</label>
            <form:input path="university" cssClass="form-control" placeholder="Enter university"/>
          </div>
          <div class="form-group mb-3">
            <label class="form-label">College</label>
            <form:input path="college" cssClass="form-control" placeholder="Enter college"/>
          </div>
          <div class="form-group mb-3">
            <label class="form-label">Year</label>
            <form:input path="year" cssClass="form-control" placeholder="Enter year"/>
          </div>
          <div class="form-group mb-3">
            <label class="form-label">Result</label>
            <form:input path="result" cssClass="form-control" placeholder="Enter result"/>
          </div>
          <div class="form-group mb-3">
            <label class="form-label">User ID</label>
            <form:input path="user.id" cssClass="form-control" placeholder="Enter user ID"/>
          </div>
          <div class="form-group">
            <button class="btn btn-primary" type="submit">Submit</button>
          </div>
        </form:form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
