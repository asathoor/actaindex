<?php /* fil: new_action.php */

require_once "header.php"; 

//print_r($_GET);

include "db.php";

/* Findes ordet? */

// query & connect
$sql = "SELECT * FROM `indexes` ";
$result =  $mysqli->query($sql); // query
$kendt = 0;

// find the needle in the haystack
while($row = $result->fetch_assoc()){
	if ($row['word'] == $_GET['ord']){
		//echo "Ordet " . $_GET['ord'] . " er kendt: ";
		$kendt++;
	}
} // /while


/* the test: is the word known? */
if ($kendt >= 1){
	//echo "ok, ok: ordet er lissom genkendt, ikk'?";
	kendtOrd($_GET['ord']);
}

if ($kendt == 0) {
	//echo "Nyt ord = " . $kendt;
	nytOrd($_GET['ord']);
}


/* handle a known index word */
function kendtOrd($ord){

	// a) sql: find id på det kendte ord
	// b) indsæt det i formularen


	?>
	<h2> Known word </h2>

	<p> Type in volume and page below. </p>

	<form action="#" method="get" enctype="multipart/form-data">
		<input type="number" name="bind" required> articles_id<br>
		<input type="number" name="side" required> Page<br>
		<input type="submit" name="OK_known" value="OK"> <input type="submit" name="Cancel" value="Cancel">
	</form>

	<?php
}


/* handle a new index word */
function nytOrd($ord){

	// save the new word in the indexes table
	include "db.php";
	$sql = "INSERT INTO `actaIndex`.`indexes` (`indexes_id`, `word`) VALUES (NULL, '".$ord."');";
	$result =  $mysqli->query($sql); // query

	$last_id = $mysqli->insert_id;
	//echo "<p> The new id: " . $last_id . "</p>";

	mysqli_close($mysqli); 
	?>

	<!-- add reference form -->
	<h2> New word: <?php echo $ord; ?> </h2>

	<p> Add volume and page below: </p>

	<form action="#" method="get" enctype="multipart/form-data">
		<input type="number" name="indexes_id" value="<?php echo $last_id; ?>" required> (Word id in indexes. Don't change it)<br>
		<input type="number" name="articles_id" required> articles_id<br>
		<input type="number" name="side_ny" required> Page<br>
		<input type="submit" name="OK_new" value="OK"> <input type="submit" name="Cancel" value="Cancel">
	</form>

	<?php

	// save the reference in the database
}

/* HANDLE THE FORMS */

// A) save a new reference

if (isset($_GET['OK_new'])){
	
	print_r($_GET);

	include "db.php";
	$sql = "INSERT INTO `actaIndex`.`contains` (`contains_id`, `articles_id`, `indexes_id`, `page`) 
		VALUES (NULL, '". $_GET['articles_id'] ."', '". $_GET['indexes_id'] ."', '".$_GET['side_ny']."');";

	echo $sql;

	$result =  $mysqli->query($sql); // query

	echo "<p> The new id: " . $last_id . "</p>";

	mysqli_close($mysqli); 


}

// B) save existing reference

// ...


require_once "footer.php"; 
?>
