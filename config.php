<?php

$servername = "localhost";
$username = "root";
$password = "";
$Tdatabase = "lezhin";
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$age = $_POST['age'];
$gender = $_POST['gender'];
$username1 = $_POST['username'];
$password1 = $_POST['password'];

// Create connection
$conn = new mysqli ($servername, $username, $password, $Tdatabase);


$sql = "INSERT INTO register (firstname, lastname, age, gender, username, password)
VALUES ('$firstname','$lastname','$age','$gender','$username1','$password1')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>