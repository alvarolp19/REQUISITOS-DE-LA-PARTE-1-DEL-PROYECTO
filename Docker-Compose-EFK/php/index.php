<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table,tr,td,th{
            border:1px solid black
        }
        img{
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body>
    <h1>PRODUCTOS DISPONIBLES php/indexphp</h1>
<?php
    $bd_usuario=$_ENV["BBDD_USUARIO"]; 
    $bd_password=$_ENV["BBDD_CLAVE"];; 
    try{ 
       $dsn=$_ENV["BBDD_CADENA_CONEXION"];; 
       $dbh=new PDO($dsn,$bd_usuario,$bd_password); 
       $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
    } catch(PDOException $e){ 
       echo $e->getMessage(); 
    }
    echo "<table>";
    echo "<tr><th>IMAGEN PRODUCTO</th><th>NOMBRE PRODUCTO</th><th>DESCRIPCION PRODUCTO</th></th>";    
    try{ 
        $consulta="SELECT * FROM Productos"; 
        $query=$dbh->prepare($consulta); 
        $query->execute(); 
        $results = $query -> fetchAll(PDO::FETCH_OBJ); 
        foreach($results as $result) { 
            echo "<tr><td><img src='" . $result->foto . "'></td><td>" . $result->nombre . "</td><td>" . $result->descripcion ."</td></tr>";        
        } 
        //enviamos el array como objeto JSON 
      }catch(PDOException $e){ }
    echo "</table>";
?>
</body>
</html>

