<?php include_once "header.php"; ?>

<ul id="menu">
	<li><a href="author.php">New Author</a></li>
	<li><a href="articleNew.php">New Article</a></li>
	<li><a href="new.php">New Word for the Index</a></li>
	<li><a href="find.php">Find</a></li>
</ul>

 <script>
  $(function() {
    $( "#menu" ).menu();
  });
 </script>

<?php include_once "footer.php"; ?> 
 
