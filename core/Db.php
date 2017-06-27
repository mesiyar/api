<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午9:02
 */

//namespace core;
//class Db
//{
//    /**
//     * @var \PDO
//     */
//    private $_db;
//
//    /**
//     * Db constructor.
//     * @param $dns
//     * @param $name
//     * @param $pass
//     */
//    public function __construct($dns, $name, $pass)
//    {
//        $this->_db = new \PDO($dns, $name, $pass);
//    }
//
//    public static function insert($table, $data)
//    {
//        $sql = "INSERT INTO `{$table}`";
//
//        foreach ($data as $k => $v) {
//            $sql .= "`{}`";
//        }
//    }
//
//}


$dns = 'mysql:host=127.0.0.1;dbname=api';
$username = 'root';
$password = 'root';

return new PDO($dns, $username, $password);