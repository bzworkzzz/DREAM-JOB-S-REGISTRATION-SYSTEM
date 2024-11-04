<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $position = $_POST['position'];
    $nationality = $_POST['nationality'];
    $date_of_birth = $_POST['date_of_birth'];
    $experience_years = $_POST['experience_years'];
    $license_number = $_POST['license_number'];

    $sql = "INSERT INTO seafarer_registration (first_name, last_name, position, nationality, date_of_birth, experience_years, license_number) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$first_name, $last_name, $position, $nationality, $date_of_birth, $experience_years, $license_number]);

    header("Location: index.php"); // Redirect to the main page
    exit();
}
?>

<form method="POST">
    First Name: <input type="text" name="first_name"><br>
    Last Name: <input type="text" name="last_name"><br>
    Position: <input type="text" name="position"><br>
    Nationality: <input type="text" name="nationality"><br>
    Date of Birth: <input type="date" name="date_of_birth"><br>
    Experience Years: <input type="number" name="experience_years"><br>
    License Number: <input type="text" name="license_number"><br>
    <button type="submit">Add Seafarer</button>
</form>
