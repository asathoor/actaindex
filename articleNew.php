<?php include_once "header.php"; ?>

<h2>New Article</h2>

<form action="#" method="get" enctype="multipart/form-data">

	<input type="text" name="title" value="title" required> Title<br>
	<input type="number" name="vol" value="Vol nr." required> Vol.<br>
	<input type="number" name="year" value="YYYY" required> Year<br>
	<button name="ok" value="ok" type="submit">OK</button>
	<button name="cancel" value="cancel" type="reset">Cancel</button>

</form>

<?php include_once "footer.php"; ?> 
 
<?php /* Insert */

if(isset($_GET['ok'])) {

	require_once "db.php";

	$sql = "INSERT INTO `actaIndex`.`articles` (`articles_id`, `title`, `vol`, `year`) 
	VALUES (NULL, '".$_GET['title']."', '".$_GET['vol']."', '".$_GET['year']."');";
	
	$insert = $mysqli->query($sql);
	echo "Ok";
}
?>