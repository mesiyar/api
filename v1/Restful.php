<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-27
 * Time: 下午4:16
 */
namespace v1;
use app\Article;
use app\User;

class Restful
{
    /**
     * 用户类
     * @var User
     */
    private $_user;
    /**
     * 文章类
     * @var Article
     */
    private $_article;

    /**
     * 允许请求的资源列表
     * @var array
     */
    private $_allowResource = [
        'users',
        'articles'
    ];

    /**
     * 允许请求的方式
     * @var array
     */
    private $_allowMethod = [
        'GET',
        'POST',
        'PUT',
        'DELETE',
        'OPTIONS'
    ];
    /**
     * 请求方法
     * @var
     */
    private $_requestMethod;

    /**
     * 资源名称
     * @var
     */
    private $_resourceName ;

    /**
     * 请求id
     * @var
     */
    private $_id ;
    /**
     * Restful constructor.
     * @param User $_user
     * @param Article $_article
     */
    public function __construct(User $_user, Article $_article)
    {
        $this->_user = $_user;
        $this->_article = $_article;
    }

    public function run()
    {
        $this->_setupRequestMethod();
        $this->_setupResource();
        $this->_setupId();
    }

    
    /**
     * @param mixed $id
     */
    private function _setupId()
    {

    }

    /**
     * @param mixed $resourceName
     */
    private function _setupResource()
    {

    }


    private function _setupRequestMethod()
    {

    }
}