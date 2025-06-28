# Spring Boot CRUD Application with Frontend jsp pages

This is a simple Spring Boot CRUD application with a frontend login, logout, and main page.

## Features

- **CRUD Operations**: Implements Create, Read, Update, and Delete operations for managing data.
- **Frontend Login**: Provides a login page for users to authenticate Displays AllUser grid after successful login.
- **Frontend signup**: Provides a signup page for Register new users.
- **Main Page**: Displays a main page for starting application.

## Technologies Used

- **Backend**:
  - Spring Boot: For creating RESTful APIs and managing dependencies.
  - myBatis ORM Tool: For database access and entity management.
  - mysql Database: An in-memory database for storing data during development.
  
- **Frontend**:
  - HTML/CSS/JavaScript: For creating user interfaces and handling frontend logic.
  - Bootstrap: A frontend framework for designing responsive.
  

### Prerequisites

-Java Development Kit (JDK) version 1.8 or above
-Apache Maven 3.6.3
-MySQL Workbench 8
-Integrated Development Environment (IDE) such as Eclipse or IntelliJ IDEA
-Web browser for accessing the frontend

## Installation and Setup

Create Scheme in Mysql Database name :Quest_demo
Query for creating scheme:CREATE DATABASE Quest_demo;
create table name as:user
Query for creating table:CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(255),
    phoneNumber BIGINT,
    email VARCHAR(255),
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    password VARCHAR(255)
);
	
Build and Run the Application:mvn clean install
successfully building then Run :mvn spring-boot:run
Access the application through your web browser with this Url :http://localhost:8088/main
