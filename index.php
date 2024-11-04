<?php
require 'db.php';

$sql = "SELECT * FROM seafarer_registration";
$stmt = $pdo->query($sql);
$seafarers = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<a href="create.php">Add New Seafarer</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Position</th>
        <th>Nationality</th>
        <th>Date of Birth</th>
        <th>Experience Years</th>
        <th>License Number</th>
        <th>Actions</th>
    </tr>
    <?php foreach ($seafarers as $seafarer): ?>
    <tr>
        <td><?= $seafarer['seafarer_id'] ?></td>
        <td><?= $seafarer['first_name'] ?></td>
        <td><?= $seafarer['last_name'] ?></td>
        <td><?= $seafarer['position'] ?></td>
        <td><?= $seafarer['nationality'] ?></td>
        <td><?= $seafarer['date_of_birth'] ?></td>
        <td><?= $seafarer['experience_years'] ?></td>
        <td><?= $seafarer['license_number'] ?></td>
        <td>
            <a href="update.php?id=<?= $seafarer['seafarer_id'] ?>">Edit</a> |
            <a href="delete.php?id=<?= $seafarer['seafarer_id'] ?>">Delete</a>
        </td>
    </tr>
    <?php endforeach; ?>
</table>
