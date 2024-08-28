<?php
session_start(); // Start session to access user login status

// Check if the user is not logged in, redirect them to the login page
if(!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("location: login.php");
    exit;
}

// The rest of your admin page content goes here
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
</head>
<body>
    <h2>Welcome, Admin!</h2>
    <!-- Your admin page content goes here -->
</body>
</html>
