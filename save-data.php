<?php

$servername = "localhost";
$username = "root";
$password = "";
$Tdatabase = "lezhin";


// Create connection
$conn = new mysqli ($servername, $username, $password, $Tdatabase);

$sql = "SELECT * FROM register";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
 	echo "<table border=1>";
 	echo "<tr><th>Firstname</th><th>Lastname</th><th>Age</th><th>Gender</th><th>Username</th><th>Password</th>";
 	while ($row = $result->fetch_assoc()) {
 		echo "<tr><td>";
 		echo $row["firstname"];
 		echo "</td><td>";
 		echo $row["lastname"];
 		echo "</td><td>";
 		echo $row["age"];
 		echo "</td><td>";
 		echo $row["gender"];
 		echo "</td><td>";
 		echo $row["username"];
 		echo "</td><td>";
 		echo $row["password"];
 		echo "</td></tr>";
 	}
 	echo "</table>";

 }
  else {
    echo "0 results";
}
 $conn->close();
?>