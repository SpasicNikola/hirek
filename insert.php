<?php
$db = new PDO("mysql:host=localhost;dbname=ahazi","root","");

if(isset($_POST['nev']) && isset($_POST['szooveg'])&& isset($_GET['id'])){
$nevv = $_POST['nev'];
$szooveg = $_POST['szooveg'];
$id = $_GET['id'];
$result = "INSERT INTO hozzaszol(nevhoz,komment,hir_idh)
VALUES(:nev,:szooveg,:id)";
$statement3=$db->prepare($result);
$statement3->bindParam(":nev",$nevv,PDO::PARAM_STR);
$statement3->bindParam(":szooveg",$szooveg,PDO::PARAM_STR);
$statement3->bindParam(":id",$id,PDO::PARAM_INT);
$statement3->execute();


}

header("Location : index.php");


?>