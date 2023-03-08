<?php
    $server = "localhost";
    $user = "root";
    $pass = "";
    $database = "fortest";

    $enlace = new mysqli($server, $user, $pass, $database);
    if($enlace->connect_errno) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    }
    // Poder ver los warnings
    error_reporting(E_ALL);
    ini_set('display_errors', '1');

    // Definir el juego de carácteres con el que se trabaja
    $charset = "utf8";
    mysqli_set_charset ($enlace , $charset);
?>