<?php
require 'db.php';

$id = $_GET['id'];
$sql = "DELETE FROM seafarer_registration WHERE seafarer_id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$id]);

header("Location: index.php"); // Redirect to the main page
exit();
?>
