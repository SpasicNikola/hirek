<?php
$db = new PDO("mysql:host=localhost;dbname=ahazi","root","");
$select="SELECT
    idh,
    hir.cim AS cimecske,
    hir.megjdatum AS datumocska,
    hir.szoveg AS szovegecske,
    COUNT(hozzaszol.idhoz) AS szam
FROM 
    hir
LEFT JOIN 
    hozzaszol 
ON 
    hozzaszol.hir_idh = hir.idh
GROUP BY 
    hir.cim";
$statement = $db->prepare($select);
$statement->execute();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style1234.css">
    <title>Hirek</title>
</head>

<body>
    <div class="cim">
        <h1>Hirek</h1>
        <p>Nikola Spasic C044ND</p>
    </div>
    <div class="cim2">
        <?php
                while($row=$statement->fetchObject()){
                    ?>      
                    <p5><?=$row->cimecske?></p5>
                    <br>
                    <i><?=$row->datumocska?></i>
                    <br>
                    <br>
                    <p3><?=$row->szovegecske?></p3>
                    <br>
                    <br>
                    <p4><?=$row->szam?> Hozzaszolas</p4>
                    <br>
                <?php
                $select2 = "SELECT nevhoz,komment,hir_idh FROM hozzaszol";
                $statement2 = $db->prepare($select2);
                $statement2->execute();
                while($row2=$statement2->fetchObject()){
                    if($row2->hir_idh == $row->idh){
                ?>        
                    <ul>
                        <li><?=$row2->nevhoz?> : <?=$row2->komment?> </li>
                    </ul>
                
                <?php }} ?>

                <p5> Uj hozzaszolas irasa</p5>
                <form method="post" action="insert.php?id=<?=$row->idh?>">
                        <label>Nev:</label><br>
                        <input type="text" name ="nev"><br>
                        <label>Szoveg:</label><br>
                        <textarea name="szooveg"></textarea><br>
                        <input type="submit" value="Kuldes">
                        <br><br>             

                </form>

                    <?php }?>

    </div>
</body>
</html>