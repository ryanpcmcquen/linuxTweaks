<?php
$result=0;
if ($result==0) echo shell_exec("rm -rf uploads/ 2>&1 && mkdir uploads/ 2>&1");
if (trim($_POST["action"]) == "IMGULT!") {
  $target_dir = "uploads/";
  $imagename = $target_dir . basename($_FILES['image_file']['name']);
  $result = @move_uploaded_file($_FILES['image_file']['tmp_name'], $imagename);
  if ($result==1) echo("Successfully uploaded: <b>".$imagename."</b>");
}
?>
<html>
<head>
<title>imgult for web</title>
<style>
input {
  padding: 5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  text-align: center;
  box-shadow: 2px 2px 5px hsla(0, 0%, 0%, 0.3);
  font-family: sans-serif;
  font-size: 1rem;
  border-radius: 20px;
}
input[type="file"] {
  background-color: hsla(360, 100%, 100%, 0.8);
  color: #000000;
}
input[type="submit"] {
  background-color: #046631;
  color: #eeeeee;
}
h1 {
  text-align: center;
}
</style>
</head>
<body>
<h1>imgult for web</h1>
<form method='POST' enctype='multipart/form-data' name='frmmain' action='imgult.php'>
<input type="file" name="image_file" multiple>
<br>
<input type="submit" value="  IMGULT!  " name="action">
</form>
<br>
<?php
if ($result==1) echo shell_exec("./imgult 2>&1");
if ($result==1) echo("<img src='".$imagename."'>"); // display the uploaded file
?>
</body>
</html>
