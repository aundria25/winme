<?php

$servername = "localhost";
$username = "root";
$password = "";
$Tdatabase = "lezhin";
$firstname = $_POST['firstname'];

 

// Create connection
$conn = new mysqli ($servername, $username, $password, $Tdatabase, $firstname);

$sql = "SELECT * FROM register WHERE firstname = '$firstname'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
 	
 	while ($row = $result->fetch_assoc()) {
 		echo "<form method='post' action='update.php'";
 		echo "<input type='text' value=".$row["firstname"].">";
 		echo "<input type='text' value=".$row["lastname"].">";
 		echo "<input type='text' value=".$row["age"].">";
 		echo "<input type='text' value=".$row["gender"].">";
 		echo "<input type='text' value=".$row["username"].">";
 		echo "<input type='text' value=".$row["password"].">";
 		echo "<input type='submit' value='Update'>";
 		echo "</form>";
}
}
  else {
    echo "Nothing Found";
}
 $conn->close();
?>