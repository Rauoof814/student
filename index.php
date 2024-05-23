<?php



// Turn on error reporting
ini_set('display-errors', 1);
error_reporting(E_ALL);


echo "<h1>PDO Demonstration</h1>";

$path = $_SERVER['DOCUMENT_ROOT'].'/../config.php';
//echo $path;

require_once $path;
//require_once $_SERVER['DOCUMENT_ROOT'].'/../config.php';

//require $_SERVER['DOCUMENT_ROOT'].'/../config.php';

try {
    //Instantiate our PDO Database Object
    $dbh = new PDO(DB_DSN, DB_USERNAME, DB_PASSWORD);
    echo 'Connected to database!!';
}
catch (PDOException $e)
{
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
}