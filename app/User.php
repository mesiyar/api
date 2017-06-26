<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午6:17
 */
namespace app;

use core\ErrorCode;

class User
{
    public $username;
    public $passwd;
    public $reg_time;
    private $salt = 'eddie';
    /**
     * 数据库连接句柄
     * @var
     */
    protected $_db;

    /**
     * User constructor.
     * @param  \PDO $_db
     */
    public function __construct($_db)
    {
        $this->_db = $_db;
    }


    /**
     * 登录
     * @param $name
     * @param $password
     * @return mixed
     * @throws \Exception
     * @internal param $passwd
     */
    public function login($name, $password)
    {
        if(empty($name)) {
            throw new \Exception('用户名不能为空', ErrorCode::USERNAME_CANNOT_EMPTY);
        }
        if(empty($password)) {
            throw new \Exception('密码不能为空',ErrorCode::PASSWORD_CANNOT_EMPTY);
        }
        $sql = 'SELECT * FROM `user` WHERE `username`=:username and `passwd`=:password';
        $stmt = $this->_db->prepare($sql);
        $stmt->bindParam(':username', $name);
        $password = $this->encryptPassword($password);
        $stmt->bindParam(':password', $password);
        if($stmt->execute()) {
            return $stmt->fetch(\PDO::FETCH_ASSOC);
        } else {
            throw new \Exception('用户名密码错误', ErrorCode::USERNAME_PASSWORD_INVALID);
        }

    }

    /**
     * 用户注册
     * @param $name
     * @param $passwd
     * @return array
     * @throws \Exception
     */
    public function register($name, $password)
    {
        if(empty($name)) {
            throw  new \Exception('用户名不能为空', ErrorCode::USERNAME_CANNOT_EMPTY);
        }
        if(empty($passwd)) {
            throw  new \Exception('密码不能为空', ErrorCode::PASSWORD_CANNOT_EMPTY);
        }
        if($this->isUsername($name)) {
            throw new \Exception('用户名已存在', ErrorCode::USERNAME_EXISTS);
        }
        $sql = 'INSERT INTO `user`(`username`,`passwd`) VALUES (:username,:password)';
        $stmt  = $this->_db->prepare($sql);
        $code = $this->encryptPassword($password);
        $stmt->bindParam(':username', $name);
        $stmt->bindParam(':password', $code);
        if(!$stmt->execute()) {
            throw new \Exception('注册失败',2);
        } else {
            return [
                'id' => $this->_db->lastInsertId(),
                'username' => $name,
            ];
        }

    }

    /**
     * @param $name
     * @return mixed
     */
    private function isUsername($name)
    {
        //查询用户名sql
        $sql =  'select id from `user` where `username` =:name';
        //预处理
        $stmt = $this->_db->prepare($sql);
        //绑定变量
        $stmt->bindParam(':name', $name);
        //执行
        $stmt->execute();
        //返回关联数组
        $result =  $stmt->fetch(\PDO::FETCH_ASSOC);
        return $result;
    }

    /**
     * @param $password
     * @return string
     */
    private function encryptPassword($password)
    {
        return md5(md5($this->salt.$password.$this->salt));
    }
}