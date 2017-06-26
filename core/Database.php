<?php
/**
 * 连接数据库并返回连接句柄
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午6:15
 */

$pdo = new PDO('mysql:host=127.0.0.1;dbname=api','root','root');
return $pdo;