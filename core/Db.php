<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午9:02
 */
$dns = 'mysql:host=127.0.0.1;dbname=api';
$username = 'root';
$password = 'root';

return new PDO($dns, $username, $password);