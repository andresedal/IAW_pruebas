<!DOCTYPE html>
<html lang="es" dir="ltr">
	<head>
		<meta charset="utf-8">
		<title>WEB 02</title>
		<link rel="stylesheet" href="css/estilo.css">
		<script src="js/prog.js"></script>
	</head>
	<body>
		<h1>
			<?php
				echo "WEB 02 FECHA ". date("Y/m/d");
			?>
		</h1>
		<pre>
			Ejecuta php -S localhost:9000
			visital con tu navegador
		</pre>
		<h1>
			Esto es un título
		</h1>
		<p>
			Esto es un párrafo
		</p>
		<?php
			echo "Esto lo escribe <b>PHP</b>";
			echo "Version <i>1.0.</i> en " . date("Ymd");
		?>
	</body>
</html>
