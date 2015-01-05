uploadfile.php 
<?php
$result=0;
if (trim($_POST["action"]) == "Upload File") { //**** User Clicked the Upload File Button
   //*********** Execute the Following Code to Upload File *************
   $imagename = basename($_FILES['image_file']['name']);  // grab name of file 
   $result = @move_uploaded_file($_FILES['image_file']['tmp_name'], $imagename); // upload it 
   if ($result==1) echo("Successfully uploaded: <b>".$imagename."</b>"); // did it work?
} // end if
?>          
<html>
<head>
<title>Upload file script</title>
</head>
<body>

<form method='POST' enctype='multipart/form-data' name='frmmain' action='uploadfile.php'>
Image: <input type="file" name="image_file">
<br>
<input type="submit" value="  Upload File  " name="action">
</form>
<br>
<?php
echo shell_exec("./imgult '.$imagename.' 2>&1");
if ($result==1) echo("<img src='".$imagename."'>"); // display the uploaded file
?>
</body>
</html>
