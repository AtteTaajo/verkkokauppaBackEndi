<?php
require_once "../inc/functions.php";
require_once "../inc/headers.php";

try{
    $dp = openDb();
    selectAsJson($dp,"select * from product");
} catch (PDOException $pdoex) {
    returnError($pdoex);
}