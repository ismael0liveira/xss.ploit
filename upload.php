<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
  <title>UPLOAD</title>
</head>
<body>
  <form enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST">
    <p>Faça upload de um arquivo:</p>
    <input type="file" name="uploaded_file"><br />
    <input type="submit" value="Upload">
  </form>
</body>
</html>
<?PHP
  if(!empty($_FILES['uploaded_file']))
  {
    $path = "uploads/";
    $path = $path.basename($_FILES['uploaded_file']['name']);

        if(move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $path)) {
          echo "Upload de ".basename( $_FILES['uploaded_file']['name'])." concluído com sucesso!! link: <a href='http://localhost/uploads/".$_FILES['uploaded_file']['name']."'>clique aqui</a>";
        } else{
          echo "Erro durante o upload, tente novamente!";
	}

  }
?>
