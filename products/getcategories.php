<?php
require_once "../inc/functions.php";
require_once "../inc/headers.php";

try{
    $dp = openDb();
    selectAsJson($dp,"select * from category order by id");
} catch (PDOException $pdoex) {
    returnError($pdoex);
}