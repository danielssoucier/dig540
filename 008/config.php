<?php
$dsn = 'mysql:dbname=danielss_historicalmusic;host=localhost;port=3306;'
$name = 'danielss_editor';
$pass = 'mainehistory1820';

$db=false;

//Connect to the Database

try {
  $db = new PDO($dsn, $name, $pass);
  $db->setAttribute(PDO : :ATTR_DEFAULT_FETCH_MODE, PDO: :FETCH_ASSOC);
} catch (PDOException $e) {die ('Could not connect to the database: </ br>)' .$e);
}



?>
