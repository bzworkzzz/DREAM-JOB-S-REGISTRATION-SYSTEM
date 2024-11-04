<?php
require 'db.php';

$id = $_GET['id'];
$sql = "SELECT * FROM seafarer_registration WHERE seafarer_id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$id]);
$seafarer = $stmt->fetch(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $position = $_POST['position'];
    $nationality = $_POST['nationality'];
    $date_of_birth = $_POST['date_of_birth'];
    $experience_years = $_POST['experience_years'];
    $license_number = $_POST['license_number'];

    $sql = "UPDATE seafarer_registration SET first_name = ?, last_name = ?, position = ?, nationality = ?, date_of_birth = ?, experience_years = ?, license_number = ? WHERE seafarer_id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$first_name, $last_name, $position, $nationality, $date_of_birth, $experience_years, $license_number, $id]);

    header("Location: index.php"); // Redirect to main page
    exit();
}
?>

<form method="POST">
    First Name: <input type="text" name="first_name" value="<?= $seafarer['first_name'] ?>"><br>
    Last Name: <input type="text" name="last_name" value="<?= $seafarer['last_name'] ?>"><br>
    Position: <input type="text" name="position" value="<?= $seafarer['position'] ?>"><br>
    Nationality: <input type="text" name="nationality" value="<?= $seafarer['nationality'] ?>"><br>
    Date of Birth: <input type="date" name="date_of_birth" value="<?= $seafarer['date_of_birth'] ?>"><br>
    Experience Years: <input type="number" name="experience_years" value="<?= $seafarer['experience_years'] ?>"><br>
    License Number: <input type="text" name="license_number" value="<?= $seafarer['license_number'] ?>"><br>
    <button type="submit">Update Seafarer</button>
</form>
