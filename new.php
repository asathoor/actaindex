<?php include "header.php"; ?>

<div class="ui-widget">
	
	<form action="new_action.php" method="get" enctype="multipart/form-data">
	
		<fieldset>
			<legend>Enter a word</legend>
			<input type="text" name="ord" id="tags" required="required"> index word<br>
			<input type="submit" name="OK" value="OK">
			<input type="reset" name="Cancel" value="Cancel">
	
	</fieldset>
	</form>

</div>

<?php include_once "footer.php"; ?>


