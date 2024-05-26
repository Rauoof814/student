<?php

/*//Turn on error reporting
ini_set('display-errors', 1);
error_reporting(E_ALL);


echo "<h1>PDO Demonstration</h1>";

$path = $_SERVER['DOCUMENT_ROOT'].'/../config.php';
echo $path;

require_once $path;
//require_once $_SERVER['DOCUMENT_ROOT'].'/../config.php';

//require $_SERVER['DOCUMENT_ROOT'].'/../config.php';

try {
    //Instantiate our PDO Database Object
    $dbh = new PDO(DB_DSN, DB_USERNAME, DB_PASSWORD);
    echo 'Connected to database!!';
}
catch (PDOException $e) {
    die( $e->getMessage() );
}


// define the query
$sql = "SELECT * FROM student";

// prepare
$stmt = $dbh->prepare($sql);

// execute
$stmt->execute();

// process the result
$result = $stmt->fetchAll();

foreach ($result as $row) {
    echo "<p>". $row['sid']. ", ". $row['last']. ", ". $row['first']. $row['birthdate']. $row['gpa'].
        $row['advisor']. "</p>";
}*/


// Turn on error reporting
ini_set('display_errors', 1);
error_reporting(E_ALL);

$path = $_SERVER['DOCUMENT_ROOT'] . '/../config.php';
require_once $path;

try {
    // Instantiate our PDO Database Object
    $dbh = new PDO(DB_DSN, DB_USERNAME, DB_PASSWORD);
    // Set the PDO error mode to exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die($e->getMessage());
}

// Check if form data has been submitted to add a new student
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the form data
    $sid = $_POST['sid'];
    $last = $_POST['last'];
    $first = $_POST['first'];
    $birthdate = $_POST['birthdate'];
    $gpa = $_POST['gpa'];
    $advisor = $_POST['advisor'];

    // Define the query to insert a new student
    $sql = "INSERT INTO student (sid, last, first, birthdate, gpa, advisor) VALUES (:sid, :last, :first, :birthdate, :gpa, :advisor)";

    try {
        // Prepare
        $stmt = $dbh->prepare($sql);

        // Bind parameters
        $stmt->bindParam(':sid', $sid);
        $stmt->bindParam(':last', $last);
        $stmt->bindParam(':first', $first);
        $stmt->bindParam(':birthdate', $birthdate);
        $stmt->bindParam(':gpa', $gpa);
        $stmt->bindParam(':advisor', $advisor);

        // Execute
        if ($stmt->execute()) {
            echo "New student added successfully!";
        } else {
            echo "Error adding student.";
        }
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    exit();
}

// Fetch the student data
$sql = "SELECT last, first FROM student";
$stmt = $dbh->prepare($sql);
$stmt->execute();
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch the advisor data
$sql = "SELECT advisor_id, advisor_first, advisor_last FROM advisor";
$stmt = $dbh->prepare($sql);
$stmt->execute();
$advisors = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Output the result as JSON if requested via AJAX
if (isset($_GET['fetch']) && $_GET['fetch'] == 'true') {
    header('Content-Type: application/json');
    echo json_encode(['students' => $students, 'advisors' => $advisors]);
    exit();
}

