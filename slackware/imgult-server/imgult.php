<?php
$result=0;
if (trim($_POST["action"]) == "upload") { //**** User Clicked the Upload File Button
   //*********** Execute the Following Code to Upload File *************
   $imagename = basename($_FILES['image_file']['name']);  // grab name of file 
   $result = @move_uploaded_file($_FILES['image_file']['tmp_name'], $imagename); // upload it 
   if ($result==1) echo("Successfully uploaded: <b>".$imagename."</b>"); // did it work?
} // end if
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
}
</style>
</head>
<body>
<form method='POST' enctype='multipart/form-data' name='frmmain' action='imgult.php'>
<input type="file" multiple name="image_file">
<br>
<input type="submit" value="  upload  " name="action">
</form>
<br>
<?php
if ($result==1) echo shell_exec("./imgult ".$imagename." 2>&1");
if ($result==1) echo("<img src='".$imagename."'>"); // display the uploaded file
?>
</body>
</html>
