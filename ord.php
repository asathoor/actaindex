<?php 
/* en liste med indexord til autofill i new.php */

/* databasen */
require_once "db.php";

$sql = "SELECT `word` FROM `indexes` order by `word`";
$result =  $mysqli->query($sql); 

/* 1. printmetode */
function skriv($what) {
	print '"'.$what.'",';
} 

/* 2. loop ordene ud */
while($row = $result->fetch_assoc()){
		skriv($row['word']);
   }

mysqli_close($mysqli); 
?>
