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
}