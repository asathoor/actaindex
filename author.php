<?php include_once "header.php"; ?>

<h2>New Author</h2>

<form action="#" method="get" enctype="multipart/form-data">

	<input type="text" name="firstName" value="firstName"><br>
	<input type="text" name="lastName" value="lastName"><br>
	<input type="text" name="degree" value="degree"><br>
	<input type="text" name="title" value="title"><br>
	<button name="ok" value="ok" type="submit">OK</button>
	<button name="cancel" value="cancel" type="reset">Cancel</button>

</form>

<?php include_once "footer.php"; ?>

<?php /* Insert */

if(isset($_GET['ok'])) {

		require_once "db.php";
	
		$sql = "INSERT INTO 
			`actaIndex`.`authors` (`authors_id`, `firstname`, `lastname`, `grad`, `titel`) 
			VALUES (NULL, '".$_GET['firstName']."', '".$_GET['lastName']."', '".$_GET['degree']."', '".$_GET['title']."')";
	
	
	$insert = $mysqli->query($sql);
	echo "Ok";
}
?>
