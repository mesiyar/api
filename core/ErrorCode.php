<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午8:38
 */
namespace core;

class ErrorCode
{
    const USERNAME_EXISTS = 1;//用户名已存在
    const USERNAME_CANNOT_EMPTY = 2;//用户名不能为空
    const PASSWORD_CANNOT_EMPTY = 3;//密码不能为空
    const USERNAME_PASSWORD_CANNOT_TOO_SHUT = 4; //用户名或密码不能太短
    const REG_FAILED = 5; //注册失败
    const USERNAME_PASSWORD_INVALID = 6;//用户名密码错误
    const TITLE_CANNOT_EMPTY = 7; //标题不能为空
    const CONTENT_CANNOT_EMPTY = 8; //内容不能为空
    const ARTICLE_RELEASE_FAILED = 9; //文章发表失败
    const ARTICLE_ID_CANNOT_EMPTY = 10; //文章发表失败
    const ARTICLE_NOT_FOUND = 11; //没有找到改文章
    const EDIT_FAILED = 12; //编辑失败
    const CANNOT_DELETE = 13 ; //不能删除
    const PERMISSION_DENIY = 14 ; //没有权限
    const SIZE_TOO_LARGE = 15 ; //没有权限
}