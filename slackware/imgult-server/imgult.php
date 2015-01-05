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
  padding: 1rem 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  text-align: center;
  font-family: georgia;
  font-size: 1rem;
  border-radius: 20px;
}
input[type="file"] {
  background-color: hsla(360, 100%, 100%, 0.8);
  color: #000000;
}
input[type="submit"].imgulter {
  background-color: #046631;
  font-size: 2rem;
  box-shadow: 0.3rem 0.3rem 0.7rem hsla(0, 0%, 0%, 0.3);
  color: #eeeeee;
}
h1 {
  text-align: center;
  text-shadow: 0.1rem 0.1rem 0.4rem hsla(0, 0%, 0%, 0.6);
}
</style>
<script>
function clearForm() {
  document.getElementById("image_dump").value="";
}
</script>
</head>
<body>
<h1>imgult for web</h1>
<form method='POST' enctype='multipart/form-data' name='frmmain' action='imgult.php'>
<input type="file" id="image_dump" name="image_file" multiple>
<br>
<input class="imgulter" type="submit" value="  IMGULT!  " name="action">
<input type="submit" value="reset" name="action" onClick="clearForm();">
</form>
<br>
<?php
if ($result==1) echo shell_exec("./imgult 2>&1");
if ($result==1) echo("<img src='".$imagename."'>");
?>
</body>
</html>
