<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-27
 * Time: 上午10:31
 */
namespace app;

use core\ErrorCode;

class Article
{
    /**
     * @var
     */
    protected $_db;

    /**
     * Article constructor.
     * @param  \ PDO $_db
     */
    public function __construct($_db)
    {
        $this->_db = $_db;
    }


    /**
     * 创建文章
     * @param $title
     * @param $content
     * @param $userId
     * @return array
     * @throws \Exception
     */
    public function create($title, $content, $userId)
    {
        if(empty($title)) {
            throw new \Exception('文章标题不能为空', ErrorCode::TITLE_CANNOT_EMPTY);
        }
        if(empty($content)) {
            throw  new \Exception('内容不能为空', ErrorCode::CONTENT_CANNOT_EMPTY);
        }
        $sql = 'INSERT INTO `article` (`title`, `content`, `author`, `create_time`, `update_time`) VALUES (:title, :content, :author, :createTime, :updateTime)';
        $createTime = date('Y-m-d H:i:s');
        $updateTime = date('Y-m-d H:i:s');
        $stmt = $this->_db->prepare($sql);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':content', $content);
        $stmt->bindParam(':author', $userId);
        $stmt->bindParam(':createTime', $createTime);
        $stmt->bindParam(':updateTime', $updateTime);
        if(!$stmt->execute()) {

            throw  new \Exception('文章发表失败1'.$stmt->errorInfo()[2], ErrorCode::ARTICLE_RELEASE_FAILED);
        }
        return [
            'id' => $this->_db->lastInsertId(),
            'title' => $title,
            'content' => $content,
            'create_time' => $createTime,
        ];
    }

    /**
     * 编辑文章
     * @param $artId
     * @param $title
     * @param $content
     * @param $userId
     * @return array
     * @throws \Exception
     */
    public function edit($artId, $title, $content, $userId)
    {

        $info = $this->view($artId);
        if(empty($info)) {
            throw new \Exception('文章不存在',  ErrorCode::ARTICLE_NOT_FOUND);
        }

        if($userId != $info['author']) {
            throw new \Exception('对不起 您没有权限', 403);
        }

        //没有传递title 就用原来的title
        $title = empty($title) ? $info['title'] : $title;
        //没有传递content 就用原来的content
        $content = empty($content) ? $info['content'] : $content;

        $sql =  'UPDATE `article` SET `title`=:title, `content`=:content ,`update_time`=:updateTime WHERE `author`=:userId AND `id`=:id ';
        $stmt = $this->_db->prepare($sql);
        $updateTime = date('Y-m-d H:i:s');
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':content', $content);
        $stmt->bindParam(':updateTime', $updateTime);
        $stmt->bindParam(':userId', $userId);
        $stmt->bindParam(':id', $artId);
        if(!$stmt->execute()) {
            throw new \Exception('编辑失败', ErrorCode::EDIT_FAILED);
        }
        return [
            'title' => $title,
            'content' => $content,
            'update_time' => $updateTime,
        ];

    }

    /**
     * 查询文章
     * @param $artId
     * @param $userId
     * @return mixed
     * @throws \Exception
     */
    public function view($artId)
    {
        if(empty($artId)) {
            throw  new \Exception('文章id不能为空', ErrorCode::ARTICLE_ID_CANNOT_EMPTY);
        }
        $sql  = 'SELECT * FROM `article` WHERE `id` = :user';
        $stmt = $this->_db->prepare($sql);
        $stmt->bindParam(':user', $artId);
        $stmt->execute();
        $res = $stmt->fetch(\PDO::FETCH_ASSOC);
        if(empty($res)) {
            throw new \Exception('没有该文章', 404);
        }
        return $res;
    }

    /**
     * 删除文章
     * @param $artId
     * @param $userId
     * @return array
     * @throws \Exception
     */
    public function delete($artId, $userId)
    {
        $article = $this->view($artId);
        if($userId != $article['author']) {
            throw  new \Exception('没有权限', ErrorCode::PERMISSION_DENIY);
        }
        $sql = 'DELETE FROM `article` WHERE `id`=:id AND `author`=:userId';
        $stmt = $this->_db->prepare($sql);
        $stmt->bindParam(':id', $artId);
        $stmt->bindParam(':userId', $userId);
        if(!$stmt->execute()) {
            $msg = $stmt->errorInfo()['data'];
            throw new \Exception($msg, 0);
        }
        return [
            'code' => 1,
            'msg' => 'success!'
        ];
    }

    /**
     * 获取文章列表
     * @param $userId
     * @param int $page
     * @param int $size
     * @return array
     * @throws \Exception
     * @internal param $artId
     */
    public function getList($userId, $page = 1, $size = 10)
    {
        if($size > 20) {
            throw new \Exception('查询条数太大', ErrorCode::SIZE_TOO_LARGE);
        }
        $page = $page <= 0 ? 1 : $page;
        $limit = ($page -1) * $size;
        $limit = $limit < 0 ? 0 : $limit;
        $sql = "SELECT * FROM `article` WHERE `author`=:id  LIMIT {$limit},{$size}";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindParam(':id',$userId);
        $stmt->execute();
        $res = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        return $res;
    }
}