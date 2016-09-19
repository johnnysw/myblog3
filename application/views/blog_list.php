<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>文章列表</title>
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0">
	<base href="<?php echo site_url();?>">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/blog_list.css">
	<script>
		window.addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
</head>
<body>
	<?php include 'header.php';?>
	<div id="blog-list" class="wrapper">
		<ul>
			<?php
				foreach($blogs as $blog){
			?>
					<li><img src="<?php echo $blog->img;?>" alt="">

						<p class="desc"><?php echo $blog->blog_id;?> - <?php echo $blog->content;?></p>

						<p class="info">
							<a href="#" class="read">READ</a>
						</p>
					</li>
			<?php
				}
			?>

		</ul>
		<div id="more">
			<button id="btn-more">加载更多...</button>
		</div>
	</div>
	<script src="js/require.js" data-main="js/blog_list"></script>

</body>
</html>