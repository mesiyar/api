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
use core\ErrorCode;

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
     * 常用的状态码及其说明
     * @var array
     */
    private $_statusCode = [
        200 => 'OK',
        204 => 'No Content',
        400 => 'Bad Request',
        401 => 'Unauthorized',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        500 => 'Server Internal Error'
    ];

    /**
     * 构造方法
     * Restful constructor.
     * @param User $_user
     * @param Article $_article
     */
    public function __construct(User $_user, Article $_article)
    {
        $this->_user = $_user;
        $this->_article = $_article;
    }

    /**
     * 公共入库
     */
    public function run()
    {
        try {
            $this->_setupRequestMethod();
            $this->_setupResource();
            //处理user
            if($this->_resourceName == 'users') {
                return $this->_json($this->_handelUsers());
                //处理 article
            } elseif($this->_resourceName == 'articles') {
                return $this->_json($this->_handelArticles());
            }
        }catch (\Exception $e) {
            $this->_json(['error' => $e->getMessage()] , $e->getCode());
        }

    }


    /**
     * 初始化请求资源
     * @param mixed $resourceName
     */
    private function _setupResource()
    {
        $path =  $_SERVER['PATH_INFO'];
        $resource = explode('/',  $path);
        $this->_resourceName = $resource[1];
        if(!in_array($this->_resourceName, $this->_allowResource)) {
            throw new \Exception('请求方法不被允许', 400);
        }
        if(!empty($resource[2])) {
            $this->_id = $resource[2];
        }
    }

    /**
     * 初始化请求方法
     */
    private function _setupRequestMethod()
    {
        $this->_requestMethod = $_SERVER['REQUEST_METHOD'];
        if(!in_array($this->_requestMethod, $this->_allowMethod)) {
            throw new \Exception('请求方法不被允许',  405);
        }
    }

    /**
     * 把数据转换成json并返回给前台
     * @param $array
     * @param int $code
     */
    private function _json($array, $code = 0) {
        //如果错误码大于0 并且不是200 表示出错 需要讲错误码显示出来
        /*if($code > 0 && $code != 200 && $code != 204) {
            header("HTTP/1.1".$code." ". $this->_statusCode[$code]);
        }*/
        //输出类型为json 标码为utf-8
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($array, JSON_UNESCAPED_UNICODE);
        exit();
    }


    /**
     * 处理users
     * @return array
     * @throws \Exception
     */
    private function _handelUsers()
    {
        if($this->_requestMethod != 'POST') {
            throw  new \Exception('请求方法不被允许', 405);
        }
        //获取请求参数
        $body = $this->_getBodyParams();

        if(empty($body['username'])) {
            throw new \Exception('用户名不能为空', 400);
        }
        if(empty($body['password'])) {
            throw new \Exception(',密码不能为空', 400);
        }
        //用户注册
        return $this->_user->register($body['username'], $body['password']);

    }


    /**
     * 处理 articles
     * @return array|mixed
     * @throws \Exception
     */
    private function _handelArticles()
    {
        switch ($this->_requestMethod ) {
                //创建
            case 'POST':
                return $this->_handelArticleCreate();
                //编辑
            case 'PUT' :
                return $this->_handelArticleEdit();
                //删除
            case 'DELETE':
                return $this->_handelArticleDelete();
                //读取
            case 'GET' :
                if(empty($this->_id)) {
                    return $this->_handelArticleList();
                } else {
                    return $this->_handelArticleView();
                }
            default :
                throw new \Exception('请求方式不被允许', 403);
        }
    }

    /**
     * 获取请求体参数
     * @return mixed
     * @throws \Exception
     */
    private function _getBodyParams()
    {

        $data = file_get_contents('php://input');
        if(empty($data)) {
            throw  new \Exception('请求参数错误', 400);
        }
        //解析成数组返回
        return json_decode($data, true);
    }


    /**
     * 处理文章创建
     * @return array
     * @throws \Exception
     */
    private function _handelArticleCreate()
    {
        $body = $this->_getBodyParams();
        if(empty($body['title'])) {
            throw new \Exception('文章标题不能为空', 400);
        }
        if(empty($body['content'])) {
            throw new \Exception('文章内容不能为空', 400);
        }
        //用户登录的处理 由于认证只能在apache 模块下进行 所以 给登录赋予一个默认值 以便通过
        //$user = $this->_userLogin($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']);
        $user = ['id' => 1];
        try{
            $article = $this->_article->create($body['title'], $body['content'], $user['id']);
            return $article;
        }catch (\Exception $e) {
            if(in_array($e->getCode(),[
                ErrorCode::TITLE_CANNOT_EMPTY,
                ErrorCode::CONTENT_CANNOT_EMPTY,
            ])) {
                throw new \Exception($e->getMessage(), 400);
            }
            throw  new \Exception($e->getMessage(), 500);
        }
    }


    /**
     * 处理文章编辑
     * @return array|mixed
     * @throws \Exception
     */
    private function _handelArticleEdit()
    {
        try{
            //同创建一样 因为无法登录 所以只能虚拟一个用户
            //$user = $this->_userLogin($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']);
            $user = ['id' => 1];
            $article = $this->_article->view($this->_id);

            if($article['author'] != $user['id']) {
                throw  new \Exception('对不起 你没有权限操作', 403);
            }

            $body = $this->_getBodyParams();

            $title = !empty($body['title']) ?  $body['title'] : $article['title'];
            $content = !empty($body['content']) ? $body['content'] : $article['content'];
            if($article['title'] == $body['title'] && $article['content'] == $body['content']) {
                return $article;
            }
            return $this->_article->edit($this->_id, $title, $content, $user['id']);
        }catch (\Exception $e){
            if($e->getCode() == ErrorCode::ARTICLE_NOT_FOUND) {
                throw new \Exception($e->getMessage(), 404);
            }
            throw new \Exception($e->getMessage(), 500);
        }

    }

    /**
     * 处理文章删除
     * @return array
     * @throws \Exception
     */
    private function _handelArticleDelete()
    {
        try{
            //同创建一样 因为无法登录 所以只能虚拟一个用户
            //$user = $this->_userLogin($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']);
            $user = ['id' => 1];
            $article = $this->_article->view($this->_id);
            if($article['author'] != $user['id']) {
                throw  new \Exception('对不起 你没有权限操作', 403);
            }
            return $this->_article->delete($article['id'], $user['id']);
        }catch (\Exception $e){
            throw new \Exception($e->getMessage(), 403);
        }
    }


    /**
     * 处理文章列表
     * @return array
     * @throws \Exception
     */
    private function _handelArticleList()
    {
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $size = isset($_GET['size']) ? $_GET['size'] : 1;
        //$user = $this->_userLogin($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']);
        $user = ['id' => 1];
        try{
            $list  = $this->_article->getList($user['id'], $page, $size);
            return $list;
        }catch (\Exception $e){
            throw new \Exception($e->getMessage(), $e->getCode());
        }
    }


    /**
     * 处理查看单个文章
     * @return mixed
     */
    private function _handelArticleView()
    {
        try{
            return $this->_article->view($this->_id);
        }catch (\Exception $e) {
            throw  new \Exception($e->getMessage(), $e->getCode());
        }

    }

    /**
     * 处理用户登录逻辑
     * @param $PHP_AUTH_USER
     * @param $PHP_AUTH_PW
     * @return mixed
     * @throws \Exception
     */
    private function _userLogin($PHP_AUTH_USER, $PHP_AUTH_PW)
    {
        try{
            return $this->_user->login($PHP_AUTH_USER, $PHP_AUTH_PW);
        }catch (\Exception $e) {
            if(in_array($e->getCode(), [
                ErrorCode::USERNAME_CANNOT_EMPTY,
                ErrorCode::PASSWORD_CANNOT_EMPTY,
                ErrorCode::USERNAME_PASSWORD_INVALID
            ])) {
                throw new \Exception($e->getMessage(), 400);
            } else {
                throw  new \Exception($e->getMessage(), 500);
            }
        }
    }
}