<?php require_once "header.php"; ?>

<form action="#" method="get" enctype="multipart/form-data">

<input type="text" name="find" required>
<input type="submit" name="submit" value="OK">

</form>

<?php require_once "footer.php"; ?> 

<pre>
	<?php /* seek */ 
		print_r($_GET)
	
	?>
</pre>