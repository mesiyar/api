<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午6:17
 */

class User
{
    public $name;
    public $passwd;
    public $reg_time;

    protected $_db;

    public function __construct($_db)
    {
        $this->_db = $_db;
    }

    /**
     * 登录
     * @param $name
     * @param $passwd
     */
    public function login($name, $passwd)
    {

    }

    /**
     * 注册
     * @param $name
     * @param $passwd
     */
    public function register($name, $passwd)
    {

    }

    private function isUsername($name)
    {
        $exist = false;
        //查询用户名sql
        $sql =  'select id from `user` where `name` =:name';
        //预处理
        $stmt = $this->_db->prepare($sql);
        //绑定变量
        $stmt->bindParam(':name', $name);
        return $exist;
    }
}