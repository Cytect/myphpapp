<?php 

$servername = "mysql";
$username = "root";
$password = "password"; // from docker-compose
$db = "food_menu_db";   // matches your SQL

try {
    $conn = new PDO("mysql:host=$servername;dbname=$db", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Failed " . $e->getMessage();
}
?>